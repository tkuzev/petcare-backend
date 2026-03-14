create table users (
    id bigserial primary key,
    email varchar(255) not null unique,
    password_hash varchar(255) not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    phone varchar(50),
    is_active boolean not null default true,
    is_email_verified boolean not null default true,
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null
);

create table companies (
    id bigserial primary key,
    name varchar(255) not null,
    bulstat varchar(50),
    email varchar(255),
    phone varchar(50),
    address varchar(500),
    status varchar(50) not null,
    subscription_plan varchar(50) not null,
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null
);

create table company_users (
    id bigserial primary key,
    company_id bigint not null references companies(id),
    user_id bigint not null references users(id),
    role varchar(50) not null,
    status varchar(50) not null,
    joined_at timestamp with time zone,
    invited_by bigint references users(id),
    created_at timestamp with time zone not null,
    updated_at timestamp with time zone not null,
    constraint uk_company_user unique (company_id, user_id)
);

create table invitations (
    id bigserial primary key,
    company_id bigint not null references companies(id),
    email varchar(255) not null,
    role varchar(50) not null,
    token_hash varchar(255) not null,
    status varchar(50) not null,
    expires_at timestamp with time zone not null,
    invited_by_user_id bigint not null references users(id),
    accepted_by_user_id bigint references users(id),
    accepted_at timestamp with time zone,
    created_at timestamp with time zone not null
);

create table refresh_tokens (
    id bigserial primary key,
    user_id bigint not null references users(id),
    token_hash varchar(255) not null,
    expires_at timestamp with time zone not null,
    revoked boolean not null default false,
    created_at timestamp with time zone not null
);
