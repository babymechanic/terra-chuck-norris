import express from 'express';
import {GetObjectCommand, S3Client} from "@aws-sdk/client-s3";

function createClient() {
    return new S3Client({region: "ap-southeast-2"});
}

const s3Client = createClient();
const command = new GetObjectCommand({
    Bucket: 'dev-chuck-norris',
    Key: 'chuck-norris.txt'
});

const app = express();
const port = 8080;

app.get('/', async (req, res) => {
    try {
        const response = await s3Client.send(command);
        const str = await response.Body.transformToString();
        res.send(str);
    } catch (e) {
        console.error(e);
        res.status(500);
        res.send("Something went wrong");
    }

});

app.listen(port, () => {
    console.log(`Chuck norris listening on port ${port}`)
})