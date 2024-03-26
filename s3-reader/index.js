import express from 'express';
import {S3Client, GetObjectCommand} from "@aws-sdk/client-s3";

const s3Client = new S3Client({region: "ap-southeast-2"});
const command = new GetObjectCommand({
    Bucket: 'dev-chuck-norris',
    Key: 'chuck-norris.txt'
});

const app = express();
const port = 8080;

app.get('/', async (req, res) => {
    const response = await s3Client.send(command);
    const str = await response.Body.transformToString();
    res.send(str);
});

app.listen(port, () => {
    console.log(`Chuck norris listening on port ${port}`)
})