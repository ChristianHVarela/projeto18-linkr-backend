import { addHashtag, deleteHashtags } from "../repositories/hashtags.repository.js";
import { deleteLike, deletePostById, getPostsOrderByCreatedAtDesc, insertLike, insertPost, updatePostById } from "../repositories/post.repository.js";
import urlMetadata from 'url-metadata';
import { insertMetada } from "../repositories/metadata.repository.js";
import { getLikes } from "../repositories/likes.repository.js";

export const createPost = async (req, res) => {
    const { link, description } = req.body
    const hashtags = extractHashtags(description)
    try {
        const user = res.locals.user
        const post = await insertPost(user.id, link, description)
        hashtags.forEach(async (hashtag) => {
            await addHashtag(hashtag, post.rows[0].id)
        })
        const metadata = await urlMetadata(link)
        await insertMetada(metadata.title, metadata.description, metadata.image, post.rows[0].id)
    } catch (error) {
        console.log(error);
        return res.status(500).send(error)
    }
    return res.status(201).send()
}

export const getPosts = async (_, res) => {
    let posts = []
    let body = []
    const userId = res.locals.user.id
    try {
        const postsResult = await getPostsOrderByCreatedAtDesc(userId)
        const { rows: likes } = await getLikes(userId)
        if (postsResult.rowCount > 0)
        {
            posts = [...postsResult.rows]
            body = buildBody(posts, likes)
        }
    } catch (error) {
        console.log(error);
        return res.status(500).send()
    }
    return res.send(body);
}

export const buildBody = (post, likes) =>{
    const likesMap = new Map();
    likes.forEach((like) => likesMap.set(like.post_id, { likes: like.likes, liked_by_me: like.liked_by_me }));
    const body = [];
    post.forEach((p) => {
        const like = likesMap.get(p.id) || { likes: [], liked_by_me:false };
        body.push({ ...p, ...like });
    });
    return body;
}

export const deletePost = async (req, res) =>{
    const { id } = req.params;
    try {
        await deletePostById(id)
        res.sendStatus(204)
    } catch (error) {
        console.log(error);
        return res.status(500).send()
    }
}

function extractHashtags(str) {
    const regex = /#([\w??-??]+)/gm;
    let matches = str.match(regex);
    if (matches) {
      return matches.map(match => match.slice(1));
    }
    return [];
  }

export const editPost = async (req, res) =>{
    const { id } = req.params;
    const { description } = req.body;
    const hashtags = extractHashtags(description);
    try{
        await deleteHashtags(id);
        hashtags.forEach(async (hashtag) => {
            await addHashtag(hashtag, id);
        });
        await updatePostById(id, description);
        return res.status(200).send();
    } catch(error){
        console.log(error);
        return res.status(500).send()
    }
}

export const likePost = async (req, res) => {
    const { id } = req.params;
    const user = res.locals.user;

    try {
        const data = await insertLike(id, user.id);
        res.status(201).send(data.rows[0]);
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
}

export const dislikePost = async (req, res) => {
    const { id } = req.params;
    const user = res.locals.user;

    try {
        const data = await deleteLike(id, user.id);
        res.status(202).send(data.rows[0]);
    } catch (error) {
        console.log(error);
        return res.status(500).send();
    }
}