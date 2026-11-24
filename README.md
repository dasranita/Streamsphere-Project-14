# StreamSphere — Project 14
Educational OTT prototype using Next.js, Express, PostgreSQL and FastAPI. Synthetic 10-second FFmpeg test video is bundled. Both catalog entries use this same clip.

## Run on Windows
Start Docker Desktop. In PowerShell: `Copy-Item .env.example .env`, edit JWT_SECRET to a random 32+ character value, then `docker compose up --build`. Open http://localhost:3000. Register, sign in, play free content or activate a simulated subscription for premium content. API health: http://localhost:4000/health. Recommendation API: http://localhost:8000/docs.

## Architecture
Browser → Express → PostgreSQL; FastAPI ranks supplied synthetic catalog/history independently. Redis is provisioned but unused. Account and playback JWT audiences are distinct. Every new media HTTP request checks current subscription and session expiry; already buffered bytes cannot be revoked. Account row lock serializes session creation; maximum two active sessions, two-minute expiry. Media is served from a private container path. Demo subscription is self-service and not a real payment. Admin role can be assigned manually for synthetic accounts using SQL; no admin UI.

## Tests
`cd api; npm test` runs pure entitlement tests. `cd engine; pip install -r requirements.txt; pytest` runs ranking test. Docker integration, browser, range request, concurrency and replay tests remain to be performed.

## Assessment status
1. Partial UI: catalog, login, player, playlist; no admin/account dashboard or resume UI.
2. Partial APIs: catalog, subscriptions, playback, playlist, progress; no upload/processing.
3. Partial schema: users, content, sessions, progress, playlist; no renditions/jobs/devices.
4. Partial security: JWT, entitlement, admin guard, session count; no refresh/revocation or device binding.
5. Missing media processing pipeline.
6. Basic recommendation endpoint; no viewing analytics or UI integration.
7. Partial session engine; progress is last-write-wins, no heartbeat.
8. Missing external integrations; local media and simulated subscription only.
9. Compose provided; Redis unused, no worker.
10. Git governance not configured.
11. Basic CI tests only, no deployment.
12. Unit tests only; integration/security testing outstanding.
13. FastAPI auto docs only; Express OpenAPI/Postman missing.
14. No cloud deployment, CDN, HTTPS or backup evidence.
15. No completed incident drills.

Do not use real subscriber data or expose this prototype publicly. This is not a completed 15-assessment submission.
