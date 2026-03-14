# PetCare Backend

Spring Boot backend skeleton for your PetCare admin app.

## Included
- Login endpoint
- Invite-only registration endpoint
- Invitation validation endpoint
- Company invite management
- PostgreSQL + Flyway
- JWT auth filter
- Multi-tenant company membership model

## Run
1. Create PostgreSQL database:
```sql
create database petcare_db;
```
2. Update `src/main/resources/application.yml` if needed.
3. Start the app:
```bash
./mvnw spring-boot:run
```
or
```bash
mvn spring-boot:run
```

## Important notes
- `POST /api/admin/companies` is not protected yet with a real super-admin check. Add that next.
- Invitation links are printed to the console for now.
- Refresh endpoint is not implemented yet. You can add it once login/register flow is working.
- The frontend should send `Authorization: Bearer <token>` and `X-Company-Id` for protected company routes.

## Main endpoints
- `POST /api/public/auth/login`
- `GET /api/public/invitations/validate?token=...`
- `POST /api/public/auth/register-from-invite`
- `POST /api/admin/companies`
- `GET /api/company/invitations`
- `POST /api/company/invitations`
- `POST /api/company/invitations/{id}/revoke`
- `POST /api/company/invitations/{id}/resend`
- `GET /api/company/users`
