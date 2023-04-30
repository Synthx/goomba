import vision from "@google-cloud/vision";
import functions from '@google-cloud/functions-framework';

const client = new vision.ImageAnnotatorClient();

functions.http('detectText', async (request, response) => {
    // todo: check authentication
    const data = request.rawBody;
    if (!data) {
        return response.status(400).send({
            message: "no body was provided",
        });
    }

    try {
        const result = await client.textDetection(data);
        return response.status(200).send(result);
    } catch (e) {
        const message = e instanceof Error ? e.message : "unknown error";
        return response.status(500).send({
            message,
        });
    }
});