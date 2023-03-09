import express from "express"
import cors from "cors"
import dotenv from "dotenv"
import signupRouter from "./routers/signup.routes.js"
import { postRouter } from './routers/post.routes.js'
import hashtagsRouter from "./routers/hashtags.routes.js"
import signinRouter from "./routers/signin.routes.js"

dotenv.config()
const server = express()
server.use(cors())
server.use(express.json())

server.use([postRouter, hashtagsRouter, signupRouter, signinRouter])

server.listen(process.env.PORT || 5000, () => {
    console.log("server is fun");
})