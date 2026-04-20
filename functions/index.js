const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const admin = require("firebase-admin");

admin.initializeApp();

exports.sendSurveyNotification = onRequest(
  {
    region: "us-west1",
    cors: true,
  },
  async (req, res) => {
    try {
      if (req.method !== "POST") {
        res.status(405).json({
          success: false,
          error: "Method not allowed",
        });
        return;
      }

      const {token, surveyId, deliveryId, title, body} = req.body;

      if (!token || !surveyId) {
        res.status(400).json({
          success: false,
          error: "token and surveyId are required",
        });
        return;
      }

      const message = {
        token,
        notification: {
          title: title || "New survey available",
          body: body || "Tap to answer a quick question.",
        },
        data: {
          type: "survey",
          surveyId: String(surveyId),
          deliveryId: String(deliveryId || ""),
        },
        android: {
          priority: "high",
        },
      };

      const response = await admin.messaging().send(message);

      logger.info("Survey notification sent", {response});

      res.status(200).json({
        success: true,
        messageId: response,
      });
    } catch (error) {
      logger.error("Failed to send survey notification", error);

      res.status(500).json({
        success: false,
        error: error.message || "Unknown error",
      });
    }
  },
);