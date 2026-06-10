# Secrets management

Never commit real secrets. Use:

- environment variables
- CI/CD secrets
- cloud secret managers
- local `.env` excluded by `.gitignore`
- `.env.example` for safe placeholders only
