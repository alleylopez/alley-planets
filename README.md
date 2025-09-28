## alley\_planets
### [www.alley\_planet.com](https://tinyurl.com/alley-planets)

Greetings, fellow astronauts!

Alley Planets is the fun educational game I’m building in my free time to blend cosmology with physics lessons. Every planet becomes a playable level where you start from scratch, gather the resources you need, and craft a plan to reach the next world. Along the way you collaborate with AI-powered agents and mentor characters who challenge you to solve the physics puzzles required to keep hopping deeper into the solar system—right up to the final planet.

This README captures the first public slice of that vision. I know the project is ambitious, and I’ve been deliberate about architecting the foundations so the experience can grow into the full game I have in mind. Feedback on the current approach (and on my Riverpod usage) is always welcome.

## Upcoming Features

* Planet mentor agents guided by adaptive physics lessons using Vertex AI Agents (Gemini models) paired with Dialogflow CX for conversational mentoring.
* Resource logistics simulator that tracks what you harvest on each world via Cloud Firestore, Cloud Functions, and Cloud Tasks to orchestrate time-based events.
* Cooperative mission control where friends can join your journey, built with Firebase Authentication, Firebase Cloud Messaging, and Cloud Run for multiplayer coordination APIs.
* Solar system analytics dashboard powered by BigQuery and Looker Studio to surface insights on player progress and difficulty tuning.
* Dynamic challenge tuning that personalizes each level through Firebase Remote Config and A/B testing with Firebase Analytics experiments.

---

## Technical Debt

* **Detail and filters**: Preview available, but requires more work to fully match the intended functionality.
* **Favorites**: Planning to implement using SharedPreferences.
* **Deep linking**: Not working as intended — e.g., it fails to correctly handle `/planets/planet-error.png`.

---

## Note

This app was built using Firebase.
For that reason, I’m providing a link to test the code. You'll also need a set of instructions for inserting data into Firestore using Postman.

> The assets used in this project are not from the API provided. I used **SORA** to generate high-quality images (800x800 pixels). These images are included as assets in the project and are also stored in Firestore.

There are some practices in the current codebase that I plan to improve over time. This is a small project for now, but I envision evolving it into an educational game to help people learn physics.

---

Let me know if you want this translated into Spanish or formatted for publishing (e.g., for GitHub).
