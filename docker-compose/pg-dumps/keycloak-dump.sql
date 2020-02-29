--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_default_roles (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_default_roles OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(4000),
    user_id character varying(36),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.credential_attribute OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_credential_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_credential_attribute (
    id character varying(36) NOT NULL,
    credential_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.fed_credential_attribute OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    device character varying(255),
    hash_iterations integer,
    salt bytea,
    type character varying(255),
    value character varying(255),
    created_date bigint,
    counter integer DEFAULT 0,
    digits integer DEFAULT 6,
    period integer DEFAULT 30,
    algorithm character varying(36) DEFAULT 'HmacSHA1'::character varying,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36),
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(36),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36)
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(36) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_default_roles; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_roles (
    realm_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_roles OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(36) NOT NULL,
    requester character varying(36) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(36)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(36) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(36),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
0f561871-5e17-4d3f-8161-423332e3f7cf	\N	auth-cookie	master	7123b757-fc16-430b-8b23-b277f0a4f9b9	2	10	f	\N	\N
bd156315-85bb-4238-a89e-3192d3fca796	\N	auth-spnego	master	7123b757-fc16-430b-8b23-b277f0a4f9b9	3	20	f	\N	\N
cd0dd7c3-1c9f-46eb-a8cd-69a50363a963	\N	identity-provider-redirector	master	7123b757-fc16-430b-8b23-b277f0a4f9b9	2	25	f	\N	\N
f6a528b9-b4ad-43e4-b74b-f8a71f797a2b	\N	\N	master	7123b757-fc16-430b-8b23-b277f0a4f9b9	2	30	t	09377f3d-2a63-43ad-973f-a0a8673d3e22	\N
1b053501-4b97-4d21-8bdf-0b097dcd46bd	\N	auth-username-password-form	master	09377f3d-2a63-43ad-973f-a0a8673d3e22	0	10	f	\N	\N
c4d0e5a7-6b10-407f-aa2d-5abf07a1cf5d	\N	auth-otp-form	master	09377f3d-2a63-43ad-973f-a0a8673d3e22	1	20	f	\N	\N
65210822-123b-409f-be43-1950d98f71ec	\N	direct-grant-validate-username	master	626e8bee-8475-4fa4-95c3-cfe848412299	0	10	f	\N	\N
1e6bac48-8397-438f-8fd4-e457c787aef0	\N	direct-grant-validate-password	master	626e8bee-8475-4fa4-95c3-cfe848412299	0	20	f	\N	\N
5b227ef4-b0c2-426a-8c78-098316bb48e8	\N	direct-grant-validate-otp	master	626e8bee-8475-4fa4-95c3-cfe848412299	1	30	f	\N	\N
cc3b052c-be69-421a-bccc-717809689de9	\N	registration-page-form	master	917e5f5b-1ee4-4013-be78-451c08f2da5c	0	10	t	217e92ce-6eb3-4873-81cd-e989eb3df1f2	\N
96ae6eba-4ca0-477d-abe7-71ddbd749103	\N	registration-user-creation	master	217e92ce-6eb3-4873-81cd-e989eb3df1f2	0	20	f	\N	\N
4fac7a03-dc72-463f-ac88-fffeaa511cee	\N	registration-profile-action	master	217e92ce-6eb3-4873-81cd-e989eb3df1f2	0	40	f	\N	\N
20aa199c-ae28-4fcf-8d3a-72bcf24e3a7f	\N	registration-password-action	master	217e92ce-6eb3-4873-81cd-e989eb3df1f2	0	50	f	\N	\N
fe7b4e7e-3972-487a-800a-a57fff08184f	\N	registration-recaptcha-action	master	217e92ce-6eb3-4873-81cd-e989eb3df1f2	3	60	f	\N	\N
90abf615-858e-4a7c-bb8c-ddaa2ce8c294	\N	reset-credentials-choose-user	master	572998cf-a96e-40bf-a72f-68c277e55c97	0	10	f	\N	\N
8636661a-748c-43e0-83be-2765811fe281	\N	reset-credential-email	master	572998cf-a96e-40bf-a72f-68c277e55c97	0	20	f	\N	\N
90fa881f-ba33-4ead-8c06-9b8f7e94f9fd	\N	reset-password	master	572998cf-a96e-40bf-a72f-68c277e55c97	0	30	f	\N	\N
e1a9ed18-e948-45b2-94a4-087fac29cfa4	\N	reset-otp	master	572998cf-a96e-40bf-a72f-68c277e55c97	1	40	f	\N	\N
f94394fd-7ca1-429c-856c-2b2bc7a5ccef	\N	client-secret	master	ad4320fa-c095-4ed8-96b8-14c97d2d869c	2	10	f	\N	\N
51d33366-31c9-4bd2-a74c-fbc397683ce9	\N	client-jwt	master	ad4320fa-c095-4ed8-96b8-14c97d2d869c	2	20	f	\N	\N
ef2cb741-520f-44c4-a46e-05fd2bacd3bf	\N	client-secret-jwt	master	ad4320fa-c095-4ed8-96b8-14c97d2d869c	2	30	f	\N	\N
0e4cdf3b-ccff-47f5-b441-f42accf8501d	\N	client-x509	master	ad4320fa-c095-4ed8-96b8-14c97d2d869c	2	40	f	\N	\N
28949e1f-1186-4ae2-85be-a439cb1600b0	\N	idp-review-profile	master	6ee4993d-6c14-406e-8de0-2ee47d9e738b	0	10	f	\N	c8909013-3059-4db8-9fde-cd2f08661a04
9f884401-4aa3-4a4e-92a0-1485982cfca2	\N	idp-create-user-if-unique	master	6ee4993d-6c14-406e-8de0-2ee47d9e738b	2	20	f	\N	1b128c10-bef8-4306-ab9f-7104304ca0cb
5b449a6a-5af1-4922-9189-30a53dcaec41	\N	\N	master	6ee4993d-6c14-406e-8de0-2ee47d9e738b	2	30	t	2fc35adb-880e-4e56-8a61-9f5bdb334564	\N
0e5cad7c-5783-4879-86be-57040a753b3c	\N	idp-confirm-link	master	2fc35adb-880e-4e56-8a61-9f5bdb334564	0	10	f	\N	\N
08cd0f78-84dd-4662-9336-25723e8428aa	\N	idp-email-verification	master	2fc35adb-880e-4e56-8a61-9f5bdb334564	2	20	f	\N	\N
3c1d28df-f563-4cf0-aa2b-63b60a7a1033	\N	\N	master	2fc35adb-880e-4e56-8a61-9f5bdb334564	2	30	t	5681c1eb-30c5-42eb-ad5b-70ec795c81d1	\N
0ed80458-b004-4047-8282-c11777f54f76	\N	idp-username-password-form	master	5681c1eb-30c5-42eb-ad5b-70ec795c81d1	0	10	f	\N	\N
9c683c0b-a724-4d62-bd13-4030b5417e36	\N	auth-otp-form	master	5681c1eb-30c5-42eb-ad5b-70ec795c81d1	1	20	f	\N	\N
6da9240e-49ab-469d-9ec7-c84f4e1f860e	\N	http-basic-authenticator	master	2b81914a-9306-4e0b-9006-6cb50940a90c	0	10	f	\N	\N
2acd40fc-c4d3-42e6-b5e2-b05412686441	\N	docker-http-basic-authenticator	master	7ae16dc3-3e51-4b56-bb26-001fd457ae6f	0	10	f	\N	\N
b1ae0a60-d61f-4db2-84ec-98274cc55b78	\N	no-cookie-redirect	master	77f9b861-e41f-4512-8377-3f840fc810c0	0	10	f	\N	\N
88835e89-6f3b-4a5d-adfa-1225d4b1af97	\N	basic-auth	master	77f9b861-e41f-4512-8377-3f840fc810c0	0	20	f	\N	\N
f6e30b66-0472-47fb-afeb-daf576fc392e	\N	basic-auth-otp	master	77f9b861-e41f-4512-8377-3f840fc810c0	3	30	f	\N	\N
39a24c80-566c-4c2e-8ac7-72b1c5ec8e3d	\N	auth-spnego	master	77f9b861-e41f-4512-8377-3f840fc810c0	3	40	f	\N	\N
65331b3b-cf7b-4e89-8962-973c452879d3	\N	auth-cookie	Demo	056f65d2-3de1-4409-9560-e161833566f5	2	10	f	\N	\N
f287e241-6703-4d03-9eea-57fddcc7f0ea	\N	auth-spnego	Demo	056f65d2-3de1-4409-9560-e161833566f5	3	20	f	\N	\N
c7622693-92ec-4188-bff4-4e84c038e6d1	\N	identity-provider-redirector	Demo	056f65d2-3de1-4409-9560-e161833566f5	2	25	f	\N	\N
52ef6be3-60f7-495c-a519-8925d15e9aa5	\N	\N	Demo	056f65d2-3de1-4409-9560-e161833566f5	2	30	t	5230a75f-2154-44d7-a34e-b6185ff2169e	\N
c713d832-5cc2-4013-bc77-cffbf4e5b790	\N	auth-username-password-form	Demo	5230a75f-2154-44d7-a34e-b6185ff2169e	0	10	f	\N	\N
243f8eab-b39c-44a2-b5c7-ea7bebbde6ff	\N	auth-otp-form	Demo	5230a75f-2154-44d7-a34e-b6185ff2169e	1	20	f	\N	\N
5d4e1db5-64fd-490d-b0c5-dbb1ba48446f	\N	direct-grant-validate-username	Demo	06f8c9b4-5fda-4143-aec2-24c1671007c9	0	10	f	\N	\N
d94ba1f4-208c-4ae9-9f2d-9a98fbe0be5a	\N	direct-grant-validate-password	Demo	06f8c9b4-5fda-4143-aec2-24c1671007c9	0	20	f	\N	\N
eabb236e-61f7-4ca3-a1cc-593421e0cf4f	\N	direct-grant-validate-otp	Demo	06f8c9b4-5fda-4143-aec2-24c1671007c9	1	30	f	\N	\N
0c9b07b3-56ae-4010-abb3-7a2ad1e7674f	\N	registration-page-form	Demo	8996d454-4504-4857-baaa-55a35bf5d69d	0	10	t	c29eae74-1e70-4716-b819-399546dd989a	\N
ab2f0729-ebdc-4f54-8a51-43199b170d0e	\N	registration-user-creation	Demo	c29eae74-1e70-4716-b819-399546dd989a	0	20	f	\N	\N
806b9890-1434-43b0-8c4f-a6d77059fa42	\N	registration-profile-action	Demo	c29eae74-1e70-4716-b819-399546dd989a	0	40	f	\N	\N
d3012bc6-16bf-492f-9e17-f17975c18acc	\N	registration-password-action	Demo	c29eae74-1e70-4716-b819-399546dd989a	0	50	f	\N	\N
ee524dba-177a-4bac-a42a-6a025eec39c1	\N	registration-recaptcha-action	Demo	c29eae74-1e70-4716-b819-399546dd989a	3	60	f	\N	\N
9d334eb9-d7a8-4217-9319-617256d6d313	\N	reset-credentials-choose-user	Demo	3ff8ddfb-fe77-4313-96fb-802609289c87	0	10	f	\N	\N
bafe3bcd-1f7c-4663-a732-729334ceeb7b	\N	reset-credential-email	Demo	3ff8ddfb-fe77-4313-96fb-802609289c87	0	20	f	\N	\N
d6462a96-a3e8-46b6-8e71-7eb6886ec07d	\N	reset-password	Demo	3ff8ddfb-fe77-4313-96fb-802609289c87	0	30	f	\N	\N
d0006b53-9f9f-4f10-bb2f-dbdcd873b7b9	\N	reset-otp	Demo	3ff8ddfb-fe77-4313-96fb-802609289c87	1	40	f	\N	\N
e84292e9-02e2-4d0d-a706-73ef42c54278	\N	client-secret	Demo	7b320d21-2bde-40d4-b7fa-0787ac759655	2	10	f	\N	\N
6af69130-9d4a-4aee-807c-d3ab894a2c3b	\N	client-jwt	Demo	7b320d21-2bde-40d4-b7fa-0787ac759655	2	20	f	\N	\N
3852a6e9-0cd6-4355-ac0b-5fa70d31a32a	\N	client-secret-jwt	Demo	7b320d21-2bde-40d4-b7fa-0787ac759655	2	30	f	\N	\N
c4da1b77-1832-4a40-a93e-3348c5744254	\N	client-x509	Demo	7b320d21-2bde-40d4-b7fa-0787ac759655	2	40	f	\N	\N
aa17119c-8808-4320-b029-d4b43fc2b4e9	\N	idp-review-profile	Demo	b3599c7d-5483-460a-9193-63f07e60151f	0	10	f	\N	c9ce9f31-12a8-4988-b2d5-b285df03ac61
e85dab5c-536c-4312-9603-b90e04baf811	\N	idp-create-user-if-unique	Demo	b3599c7d-5483-460a-9193-63f07e60151f	2	20	f	\N	067f4df2-c27f-4f4e-891d-e0368e39f2d4
bea4a155-6452-4d54-a370-efdeb61ca2e2	\N	\N	Demo	b3599c7d-5483-460a-9193-63f07e60151f	2	30	t	1c0ebedc-0561-49dc-92f6-bc20bb50f034	\N
98d439cd-9fbf-4bd6-b405-44c766c54cc4	\N	idp-confirm-link	Demo	1c0ebedc-0561-49dc-92f6-bc20bb50f034	0	10	f	\N	\N
d3c052cd-b13b-4be6-9974-3244476221c7	\N	idp-email-verification	Demo	1c0ebedc-0561-49dc-92f6-bc20bb50f034	2	20	f	\N	\N
367803e7-1c23-49e9-ba6b-c76be9faf0f8	\N	\N	Demo	1c0ebedc-0561-49dc-92f6-bc20bb50f034	2	30	t	12041501-f504-4900-ac33-aea0784b43c5	\N
fca3431d-9bb9-41ab-ab9d-03cbc549a255	\N	idp-username-password-form	Demo	12041501-f504-4900-ac33-aea0784b43c5	0	10	f	\N	\N
95c3ea5e-82c5-4c3e-880a-6be9b05631dd	\N	auth-otp-form	Demo	12041501-f504-4900-ac33-aea0784b43c5	1	20	f	\N	\N
0631abf7-d1bb-4f42-9cf8-3b64e08a7535	\N	http-basic-authenticator	Demo	2fbee7a0-15e9-461b-93bd-9ac4601dccff	0	10	f	\N	\N
a32b0007-fe59-4a05-a014-c814486f00a4	\N	docker-http-basic-authenticator	Demo	f81334ea-d98a-4f45-82ae-567d0da71e7c	0	10	f	\N	\N
332055bd-d804-448a-8428-32c802356d58	\N	no-cookie-redirect	Demo	2391ef11-8923-468f-987d-afcb4815cf6a	0	10	f	\N	\N
02e7fbee-ba41-41b0-96e9-95fc326cd777	\N	basic-auth	Demo	2391ef11-8923-468f-987d-afcb4815cf6a	0	20	f	\N	\N
75e7d751-e568-493b-a75c-247c53aa0a1f	\N	basic-auth-otp	Demo	2391ef11-8923-468f-987d-afcb4815cf6a	3	30	f	\N	\N
d99015b8-a2d7-45f3-9c03-a6f357433571	\N	auth-spnego	Demo	2391ef11-8923-468f-987d-afcb4815cf6a	3	40	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
7123b757-fc16-430b-8b23-b277f0a4f9b9	browser	browser based authentication	master	basic-flow	t	t
09377f3d-2a63-43ad-973f-a0a8673d3e22	forms	Username, password, otp and other auth forms.	master	basic-flow	f	t
626e8bee-8475-4fa4-95c3-cfe848412299	direct grant	OpenID Connect Resource Owner Grant	master	basic-flow	t	t
917e5f5b-1ee4-4013-be78-451c08f2da5c	registration	registration flow	master	basic-flow	t	t
217e92ce-6eb3-4873-81cd-e989eb3df1f2	registration form	registration form	master	form-flow	f	t
572998cf-a96e-40bf-a72f-68c277e55c97	reset credentials	Reset credentials for a user if they forgot their password or something	master	basic-flow	t	t
ad4320fa-c095-4ed8-96b8-14c97d2d869c	clients	Base authentication for clients	master	client-flow	t	t
6ee4993d-6c14-406e-8de0-2ee47d9e738b	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	master	basic-flow	t	t
2fc35adb-880e-4e56-8a61-9f5bdb334564	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	master	basic-flow	f	t
5681c1eb-30c5-42eb-ad5b-70ec795c81d1	Verify Existing Account by Re-authentication	Reauthentication of existing account	master	basic-flow	f	t
2b81914a-9306-4e0b-9006-6cb50940a90c	saml ecp	SAML ECP Profile Authentication Flow	master	basic-flow	t	t
7ae16dc3-3e51-4b56-bb26-001fd457ae6f	docker auth	Used by Docker clients to authenticate against the IDP	master	basic-flow	t	t
77f9b861-e41f-4512-8377-3f840fc810c0	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	master	basic-flow	t	t
056f65d2-3de1-4409-9560-e161833566f5	browser	browser based authentication	Demo	basic-flow	t	t
5230a75f-2154-44d7-a34e-b6185ff2169e	forms	Username, password, otp and other auth forms.	Demo	basic-flow	f	t
06f8c9b4-5fda-4143-aec2-24c1671007c9	direct grant	OpenID Connect Resource Owner Grant	Demo	basic-flow	t	t
8996d454-4504-4857-baaa-55a35bf5d69d	registration	registration flow	Demo	basic-flow	t	t
c29eae74-1e70-4716-b819-399546dd989a	registration form	registration form	Demo	form-flow	f	t
3ff8ddfb-fe77-4313-96fb-802609289c87	reset credentials	Reset credentials for a user if they forgot their password or something	Demo	basic-flow	t	t
7b320d21-2bde-40d4-b7fa-0787ac759655	clients	Base authentication for clients	Demo	client-flow	t	t
b3599c7d-5483-460a-9193-63f07e60151f	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	Demo	basic-flow	t	t
1c0ebedc-0561-49dc-92f6-bc20bb50f034	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	Demo	basic-flow	f	t
12041501-f504-4900-ac33-aea0784b43c5	Verify Existing Account by Re-authentication	Reauthentication of existing account	Demo	basic-flow	f	t
2fbee7a0-15e9-461b-93bd-9ac4601dccff	saml ecp	SAML ECP Profile Authentication Flow	Demo	basic-flow	t	t
f81334ea-d98a-4f45-82ae-567d0da71e7c	docker auth	Used by Docker clients to authenticate against the IDP	Demo	basic-flow	t	t
2391ef11-8923-468f-987d-afcb4815cf6a	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	Demo	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
c8909013-3059-4db8-9fde-cd2f08661a04	review profile config	master
1b128c10-bef8-4306-ab9f-7104304ca0cb	create unique user config	master
c9ce9f31-12a8-4988-b2d5-b285df03ac61	review profile config	Demo
067f4df2-c27f-4f4e-891d-e0368e39f2d4	create unique user config	Demo
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
c8909013-3059-4db8-9fde-cd2f08661a04	missing	update.profile.on.first.login
1b128c10-bef8-4306-ab9f-7104304ca0cb	false	require.password.update.after.registration
c9ce9f31-12a8-4988-b2d5-b285df03ac61	missing	update.profile.on.first.login
067f4df2-c27f-4f4e-891d-e0368e39f2d4	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled) FROM stdin;
921e2f83-96b2-4f85-8f09-bf63e686a387	t	t	master-realm	0	f	d65f95b3-68b2-4855-8448-90609ae1b0e8	\N	t	\N	f	master	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f
34304f4f-a3f7-4302-9e71-eecd04c640d0	t	f	account	0	f	4def9bd8-6c96-463c-994d-d061347fc788	/auth/realms/master/account	f	\N	f	master	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
07477098-d643-494c-b286-1e92918c14ac	t	f	broker	0	f	a625d985-bb90-4731-a1d8-5d1fa98991b1	\N	f	\N	f	master	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
47c573b1-4c7b-4e30-8154-866c8055a8eb	t	f	security-admin-console	0	t	3ba317c9-9cf6-4d55-b327-3ccd1e59ee68	/auth/admin/master/console/index.html	f	\N	f	master	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
b63e3765-16ec-44f9-9386-b244db87d24a	t	f	admin-cli	0	t	2b0d5dc3-0425-497e-9af2-50b56fc96a1e	\N	f	\N	f	master	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
803e6509-76e4-45b7-9d98-aeea827c94cb	t	f	realm-management	0	f	49fa25f5-0926-471a-a9ef-ccde97ba00d3	\N	t	\N	f	Demo	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f
3c582625-675a-4f89-87ec-ef6a400f4c9d	t	f	broker	0	f	18dc365e-09e2-47a6-a4b9-7613f1248122	\N	f	\N	f	Demo	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f
31e38eab-c659-47b9-8b69-e960a84ff2c3	t	f	admin-cli	0	t	058bdc7a-c350-4a07-bb59-299c514f0541	\N	f	\N	f	Demo	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	t	t	test-client	0	f	205f7786-4464-4ee6-b042-0c07ae514d9f	\N	f	\N	f	Demo	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	t	demo-realm	0	f	cd1db875-4c40-4b3b-90f9-fb3693305fb3	\N	t	\N	f	master	\N	0	f	f	Demo Realm	f	client-secret	\N	\N	\N	t	f	f
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	t	f	security-admin-console	0	t	b356fdf1-9fd3-4b73-afc8-c33197681489	/auth/admin/demo/console/index.html	f	\N	f	Demo	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	\N	\N	\N	t	f	f
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	t	f	account	0	f	fbf09248-ac31-441a-b1b1-742927d1b7f9	/auth/realms/demo/account	f	\N	f	Demo	openid-connect	0	f	f	${client_account}	f	client-secret	\N	\N	\N	t	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.server.signature
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.server.signature.keyinfo.ext
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.assertion.signature
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.client.signature
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.encrypt
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.authnstatement
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.onetimeuse.condition
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml_force_name_id_format
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.multivalued.roles
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	saml.force.post.binding
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	exclude.session.state.from.auth.response
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	tls.client.certificate.bound.access.tokens
c0ddcd89-023d-4b83-bb1b-02869e61f470	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_default_roles (client_id, role_id) FROM stdin;
34304f4f-a3f7-4302-9e71-eecd04c640d0	2fe57b70-4fee-4280-bbed-2ba16847bd6e
34304f4f-a3f7-4302-9e71-eecd04c640d0	c7246f7f-b1c2-483f-af90-f4313ce17662
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	3cf6e888-ae63-4b8e-b7ee-bdabe7d5ec0e
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	d3def975-64e1-4a24-b969-9dcb7221acb4
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
ca391498-4e4d-433a-8521-a8769c450749	offline_access	master	OpenID Connect built-in scope: offline_access	openid-connect
1e6f0147-2981-49f0-a565-225a69940079	role_list	master	SAML role list	saml
2627a628-a071-40b3-ab5f-457038793e07	profile	master	OpenID Connect built-in scope: profile	openid-connect
7deece3e-6ed7-4f6c-91c0-b6e550199b70	email	master	OpenID Connect built-in scope: email	openid-connect
333435db-7853-4e29-b4d8-d8b808c11a2a	address	master	OpenID Connect built-in scope: address	openid-connect
8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	phone	master	OpenID Connect built-in scope: phone	openid-connect
49ab8431-58a3-4877-963e-37bcafebe0d1	roles	master	OpenID Connect scope for add user roles to the access token	openid-connect
44208e16-8fdd-4d66-8bbe-a50d115aca27	web-origins	master	OpenID Connect scope for add allowed web origins to the access token	openid-connect
c75879b2-fae2-4301-9a0a-658c8ed49a58	microprofile-jwt	master	Microprofile - JWT built-in scope	openid-connect
12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	offline_access	Demo	OpenID Connect built-in scope: offline_access	openid-connect
62349c73-be99-47ed-8d40-7339a875e429	role_list	Demo	SAML role list	saml
a7d87e5e-d029-433f-b38a-837f84489caf	profile	Demo	OpenID Connect built-in scope: profile	openid-connect
f61c4983-6312-48c9-88f2-900638f9b194	email	Demo	OpenID Connect built-in scope: email	openid-connect
d4ae4769-54a6-4dbf-86e5-1027a9612e43	address	Demo	OpenID Connect built-in scope: address	openid-connect
8dc9e1df-653f-438f-800e-d83278df7ca7	phone	Demo	OpenID Connect built-in scope: phone	openid-connect
59dca199-ddf4-4f54-9216-52f1684fdc97	roles	Demo	OpenID Connect scope for add user roles to the access token	openid-connect
93ef66e9-ee76-4d1f-be25-6b3871960552	web-origins	Demo	OpenID Connect scope for add allowed web origins to the access token	openid-connect
bf41b9a1-2368-410e-85b3-cb17ce5eaa96	microprofile-jwt	Demo	Microprofile - JWT built-in scope	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
ca391498-4e4d-433a-8521-a8769c450749	true	display.on.consent.screen
ca391498-4e4d-433a-8521-a8769c450749	${offlineAccessScopeConsentText}	consent.screen.text
1e6f0147-2981-49f0-a565-225a69940079	true	display.on.consent.screen
1e6f0147-2981-49f0-a565-225a69940079	${samlRoleListScopeConsentText}	consent.screen.text
2627a628-a071-40b3-ab5f-457038793e07	true	display.on.consent.screen
2627a628-a071-40b3-ab5f-457038793e07	${profileScopeConsentText}	consent.screen.text
2627a628-a071-40b3-ab5f-457038793e07	true	include.in.token.scope
7deece3e-6ed7-4f6c-91c0-b6e550199b70	true	display.on.consent.screen
7deece3e-6ed7-4f6c-91c0-b6e550199b70	${emailScopeConsentText}	consent.screen.text
7deece3e-6ed7-4f6c-91c0-b6e550199b70	true	include.in.token.scope
333435db-7853-4e29-b4d8-d8b808c11a2a	true	display.on.consent.screen
333435db-7853-4e29-b4d8-d8b808c11a2a	${addressScopeConsentText}	consent.screen.text
333435db-7853-4e29-b4d8-d8b808c11a2a	true	include.in.token.scope
8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	true	display.on.consent.screen
8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	${phoneScopeConsentText}	consent.screen.text
8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	true	include.in.token.scope
49ab8431-58a3-4877-963e-37bcafebe0d1	true	display.on.consent.screen
49ab8431-58a3-4877-963e-37bcafebe0d1	${rolesScopeConsentText}	consent.screen.text
49ab8431-58a3-4877-963e-37bcafebe0d1	false	include.in.token.scope
44208e16-8fdd-4d66-8bbe-a50d115aca27	false	display.on.consent.screen
44208e16-8fdd-4d66-8bbe-a50d115aca27		consent.screen.text
44208e16-8fdd-4d66-8bbe-a50d115aca27	false	include.in.token.scope
c75879b2-fae2-4301-9a0a-658c8ed49a58	false	display.on.consent.screen
c75879b2-fae2-4301-9a0a-658c8ed49a58	true	include.in.token.scope
12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	true	display.on.consent.screen
12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	${offlineAccessScopeConsentText}	consent.screen.text
62349c73-be99-47ed-8d40-7339a875e429	true	display.on.consent.screen
62349c73-be99-47ed-8d40-7339a875e429	${samlRoleListScopeConsentText}	consent.screen.text
a7d87e5e-d029-433f-b38a-837f84489caf	true	display.on.consent.screen
a7d87e5e-d029-433f-b38a-837f84489caf	${profileScopeConsentText}	consent.screen.text
a7d87e5e-d029-433f-b38a-837f84489caf	true	include.in.token.scope
f61c4983-6312-48c9-88f2-900638f9b194	true	display.on.consent.screen
f61c4983-6312-48c9-88f2-900638f9b194	${emailScopeConsentText}	consent.screen.text
f61c4983-6312-48c9-88f2-900638f9b194	true	include.in.token.scope
d4ae4769-54a6-4dbf-86e5-1027a9612e43	true	display.on.consent.screen
d4ae4769-54a6-4dbf-86e5-1027a9612e43	${addressScopeConsentText}	consent.screen.text
d4ae4769-54a6-4dbf-86e5-1027a9612e43	true	include.in.token.scope
8dc9e1df-653f-438f-800e-d83278df7ca7	true	display.on.consent.screen
8dc9e1df-653f-438f-800e-d83278df7ca7	${phoneScopeConsentText}	consent.screen.text
8dc9e1df-653f-438f-800e-d83278df7ca7	true	include.in.token.scope
59dca199-ddf4-4f54-9216-52f1684fdc97	true	display.on.consent.screen
59dca199-ddf4-4f54-9216-52f1684fdc97	${rolesScopeConsentText}	consent.screen.text
59dca199-ddf4-4f54-9216-52f1684fdc97	false	include.in.token.scope
93ef66e9-ee76-4d1f-be25-6b3871960552	false	display.on.consent.screen
93ef66e9-ee76-4d1f-be25-6b3871960552		consent.screen.text
93ef66e9-ee76-4d1f-be25-6b3871960552	false	include.in.token.scope
bf41b9a1-2368-410e-85b3-cb17ce5eaa96	false	display.on.consent.screen
bf41b9a1-2368-410e-85b3-cb17ce5eaa96	true	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
34304f4f-a3f7-4302-9e71-eecd04c640d0	1e6f0147-2981-49f0-a565-225a69940079	t
b63e3765-16ec-44f9-9386-b244db87d24a	1e6f0147-2981-49f0-a565-225a69940079	t
07477098-d643-494c-b286-1e92918c14ac	1e6f0147-2981-49f0-a565-225a69940079	t
921e2f83-96b2-4f85-8f09-bf63e686a387	1e6f0147-2981-49f0-a565-225a69940079	t
47c573b1-4c7b-4e30-8154-866c8055a8eb	1e6f0147-2981-49f0-a565-225a69940079	t
34304f4f-a3f7-4302-9e71-eecd04c640d0	2627a628-a071-40b3-ab5f-457038793e07	t
34304f4f-a3f7-4302-9e71-eecd04c640d0	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
34304f4f-a3f7-4302-9e71-eecd04c640d0	49ab8431-58a3-4877-963e-37bcafebe0d1	t
34304f4f-a3f7-4302-9e71-eecd04c640d0	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
34304f4f-a3f7-4302-9e71-eecd04c640d0	ca391498-4e4d-433a-8521-a8769c450749	f
34304f4f-a3f7-4302-9e71-eecd04c640d0	333435db-7853-4e29-b4d8-d8b808c11a2a	f
34304f4f-a3f7-4302-9e71-eecd04c640d0	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
34304f4f-a3f7-4302-9e71-eecd04c640d0	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
b63e3765-16ec-44f9-9386-b244db87d24a	2627a628-a071-40b3-ab5f-457038793e07	t
b63e3765-16ec-44f9-9386-b244db87d24a	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
b63e3765-16ec-44f9-9386-b244db87d24a	49ab8431-58a3-4877-963e-37bcafebe0d1	t
b63e3765-16ec-44f9-9386-b244db87d24a	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
b63e3765-16ec-44f9-9386-b244db87d24a	ca391498-4e4d-433a-8521-a8769c450749	f
b63e3765-16ec-44f9-9386-b244db87d24a	333435db-7853-4e29-b4d8-d8b808c11a2a	f
b63e3765-16ec-44f9-9386-b244db87d24a	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
b63e3765-16ec-44f9-9386-b244db87d24a	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
07477098-d643-494c-b286-1e92918c14ac	2627a628-a071-40b3-ab5f-457038793e07	t
07477098-d643-494c-b286-1e92918c14ac	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
07477098-d643-494c-b286-1e92918c14ac	49ab8431-58a3-4877-963e-37bcafebe0d1	t
07477098-d643-494c-b286-1e92918c14ac	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
07477098-d643-494c-b286-1e92918c14ac	ca391498-4e4d-433a-8521-a8769c450749	f
07477098-d643-494c-b286-1e92918c14ac	333435db-7853-4e29-b4d8-d8b808c11a2a	f
07477098-d643-494c-b286-1e92918c14ac	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
07477098-d643-494c-b286-1e92918c14ac	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
921e2f83-96b2-4f85-8f09-bf63e686a387	2627a628-a071-40b3-ab5f-457038793e07	t
921e2f83-96b2-4f85-8f09-bf63e686a387	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
921e2f83-96b2-4f85-8f09-bf63e686a387	49ab8431-58a3-4877-963e-37bcafebe0d1	t
921e2f83-96b2-4f85-8f09-bf63e686a387	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
921e2f83-96b2-4f85-8f09-bf63e686a387	ca391498-4e4d-433a-8521-a8769c450749	f
921e2f83-96b2-4f85-8f09-bf63e686a387	333435db-7853-4e29-b4d8-d8b808c11a2a	f
921e2f83-96b2-4f85-8f09-bf63e686a387	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
921e2f83-96b2-4f85-8f09-bf63e686a387	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
47c573b1-4c7b-4e30-8154-866c8055a8eb	2627a628-a071-40b3-ab5f-457038793e07	t
47c573b1-4c7b-4e30-8154-866c8055a8eb	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
47c573b1-4c7b-4e30-8154-866c8055a8eb	49ab8431-58a3-4877-963e-37bcafebe0d1	t
47c573b1-4c7b-4e30-8154-866c8055a8eb	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
47c573b1-4c7b-4e30-8154-866c8055a8eb	ca391498-4e4d-433a-8521-a8769c450749	f
47c573b1-4c7b-4e30-8154-866c8055a8eb	333435db-7853-4e29-b4d8-d8b808c11a2a	f
47c573b1-4c7b-4e30-8154-866c8055a8eb	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
47c573b1-4c7b-4e30-8154-866c8055a8eb	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
f5f980fe-2c9f-4f3a-ae05-65613a112afd	1e6f0147-2981-49f0-a565-225a69940079	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	2627a628-a071-40b3-ab5f-457038793e07	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	49ab8431-58a3-4877-963e-37bcafebe0d1	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
f5f980fe-2c9f-4f3a-ae05-65613a112afd	ca391498-4e4d-433a-8521-a8769c450749	f
f5f980fe-2c9f-4f3a-ae05-65613a112afd	333435db-7853-4e29-b4d8-d8b808c11a2a	f
f5f980fe-2c9f-4f3a-ae05-65613a112afd	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
f5f980fe-2c9f-4f3a-ae05-65613a112afd	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
803e6509-76e4-45b7-9d98-aeea827c94cb	62349c73-be99-47ed-8d40-7339a875e429	t
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	62349c73-be99-47ed-8d40-7339a875e429	t
3c582625-675a-4f89-87ec-ef6a400f4c9d	62349c73-be99-47ed-8d40-7339a875e429	t
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	62349c73-be99-47ed-8d40-7339a875e429	t
31e38eab-c659-47b9-8b69-e960a84ff2c3	62349c73-be99-47ed-8d40-7339a875e429	t
803e6509-76e4-45b7-9d98-aeea827c94cb	a7d87e5e-d029-433f-b38a-837f84489caf	t
803e6509-76e4-45b7-9d98-aeea827c94cb	f61c4983-6312-48c9-88f2-900638f9b194	t
803e6509-76e4-45b7-9d98-aeea827c94cb	59dca199-ddf4-4f54-9216-52f1684fdc97	t
803e6509-76e4-45b7-9d98-aeea827c94cb	93ef66e9-ee76-4d1f-be25-6b3871960552	t
803e6509-76e4-45b7-9d98-aeea827c94cb	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
803e6509-76e4-45b7-9d98-aeea827c94cb	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
803e6509-76e4-45b7-9d98-aeea827c94cb	8dc9e1df-653f-438f-800e-d83278df7ca7	f
803e6509-76e4-45b7-9d98-aeea827c94cb	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	a7d87e5e-d029-433f-b38a-837f84489caf	t
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	f61c4983-6312-48c9-88f2-900638f9b194	t
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	59dca199-ddf4-4f54-9216-52f1684fdc97	t
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	93ef66e9-ee76-4d1f-be25-6b3871960552	t
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	8dc9e1df-653f-438f-800e-d83278df7ca7	f
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
3c582625-675a-4f89-87ec-ef6a400f4c9d	a7d87e5e-d029-433f-b38a-837f84489caf	t
3c582625-675a-4f89-87ec-ef6a400f4c9d	f61c4983-6312-48c9-88f2-900638f9b194	t
3c582625-675a-4f89-87ec-ef6a400f4c9d	59dca199-ddf4-4f54-9216-52f1684fdc97	t
3c582625-675a-4f89-87ec-ef6a400f4c9d	93ef66e9-ee76-4d1f-be25-6b3871960552	t
3c582625-675a-4f89-87ec-ef6a400f4c9d	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
3c582625-675a-4f89-87ec-ef6a400f4c9d	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
3c582625-675a-4f89-87ec-ef6a400f4c9d	8dc9e1df-653f-438f-800e-d83278df7ca7	f
3c582625-675a-4f89-87ec-ef6a400f4c9d	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	a7d87e5e-d029-433f-b38a-837f84489caf	t
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	f61c4983-6312-48c9-88f2-900638f9b194	t
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	59dca199-ddf4-4f54-9216-52f1684fdc97	t
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	93ef66e9-ee76-4d1f-be25-6b3871960552	t
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	8dc9e1df-653f-438f-800e-d83278df7ca7	f
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
31e38eab-c659-47b9-8b69-e960a84ff2c3	a7d87e5e-d029-433f-b38a-837f84489caf	t
31e38eab-c659-47b9-8b69-e960a84ff2c3	f61c4983-6312-48c9-88f2-900638f9b194	t
31e38eab-c659-47b9-8b69-e960a84ff2c3	59dca199-ddf4-4f54-9216-52f1684fdc97	t
31e38eab-c659-47b9-8b69-e960a84ff2c3	93ef66e9-ee76-4d1f-be25-6b3871960552	t
31e38eab-c659-47b9-8b69-e960a84ff2c3	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
31e38eab-c659-47b9-8b69-e960a84ff2c3	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
31e38eab-c659-47b9-8b69-e960a84ff2c3	8dc9e1df-653f-438f-800e-d83278df7ca7	f
31e38eab-c659-47b9-8b69-e960a84ff2c3	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
c0ddcd89-023d-4b83-bb1b-02869e61f470	62349c73-be99-47ed-8d40-7339a875e429	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	a7d87e5e-d029-433f-b38a-837f84489caf	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	f61c4983-6312-48c9-88f2-900638f9b194	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	59dca199-ddf4-4f54-9216-52f1684fdc97	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	93ef66e9-ee76-4d1f-be25-6b3871960552	t
c0ddcd89-023d-4b83-bb1b-02869e61f470	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
c0ddcd89-023d-4b83-bb1b-02869e61f470	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
c0ddcd89-023d-4b83-bb1b-02869e61f470	8dc9e1df-653f-438f-800e-d83278df7ca7	f
c0ddcd89-023d-4b83-bb1b-02869e61f470	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
ca391498-4e4d-433a-8521-a8769c450749	937853b7-42b3-46d9-a490-a4eb425153be
12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	74dce7d6-1086-425c-ab42-c950e375ff5a
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
01cebd7a-4868-41f2-809b-e49c1f1ddb6e	Trusted Hosts	master	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
19db9ad2-17f9-49e7-97f6-976b157b7e9a	Consent Required	master	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
38b08b32-79a9-4137-a77f-2ec88bec6eb8	Full Scope Disabled	master	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
e0da5a83-ecd1-41e2-9cee-532f514d3af3	Max Clients Limit	master	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
e902768c-653a-4629-9254-1e9e439adffd	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
2b5f89f3-54c1-4304-81c2-c8d2fc97054a	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	anonymous
4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	Allowed Protocol Mapper Types	master	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
c66e706b-c963-4bcf-ac08-0b99fd5c3eb3	Allowed Client Scopes	master	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	master	authenticated
10ab5cb4-2a63-4d36-bf42-309644d67aec	rsa-generated	master	rsa-generated	org.keycloak.keys.KeyProvider	master	\N
64512556-39b2-4da4-a809-72e4b79fcd38	hmac-generated	master	hmac-generated	org.keycloak.keys.KeyProvider	master	\N
993bb9dd-9c92-4b53-be30-2ab48cb1d465	aes-generated	master	aes-generated	org.keycloak.keys.KeyProvider	master	\N
72e865ff-0079-40e8-b1b8-2bcd84c92840	rsa-generated	Demo	rsa-generated	org.keycloak.keys.KeyProvider	Demo	\N
7ed97dc7-2574-47c0-b7f0-77c25d446882	hmac-generated	Demo	hmac-generated	org.keycloak.keys.KeyProvider	Demo	\N
46f201d9-8df3-451e-9594-642b7312d59f	aes-generated	Demo	aes-generated	org.keycloak.keys.KeyProvider	Demo	\N
4bf56820-40b7-43de-94d6-afa15eaedcd2	Trusted Hosts	Demo	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
994dbd9a-ac20-4d6a-a06e-f80790e5982c	Consent Required	Demo	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
9c620fb1-165d-4742-9110-c0e3f6a11809	Full Scope Disabled	Demo	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
b5632cf8-9faa-463e-a75d-d3f5ad2a7b2b	Max Clients Limit	Demo	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
10d61a6f-b9cb-4488-a4cc-7dda6b78362a	Allowed Protocol Mapper Types	Demo	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
a76a83bb-acf1-45f8-80e2-a5deff660ce2	Allowed Client Scopes	Demo	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	anonymous
33a1eda6-e2c8-4987-a33a-038524b93687	Allowed Protocol Mapper Types	Demo	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	authenticated
87ceb9c6-3494-48e6-a4ea-8bb47dc2eeb4	Allowed Client Scopes	Demo	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	Demo	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
a5a143e9-e310-4cb5-b47d-c2601bd6054b	2b5f89f3-54c1-4304-81c2-c8d2fc97054a	allow-default-scopes	true
47c855b6-2e17-45da-814d-0b7449a1933e	e0da5a83-ecd1-41e2-9cee-532f514d3af3	max-clients	200
1bef7b6a-c323-4248-b223-f8914abc64b6	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
80d70c61-daf8-46eb-a6c7-061f808dc11c	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
40ab9716-421a-4414-81ba-4a6ea0b2157c	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	saml-user-attribute-mapper
90e4473b-a4de-48ee-829d-e341879f57e5	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
d0699361-bcab-425d-bd47-fb7517243e48	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	saml-user-property-mapper
9f36e468-b827-4c2f-bc00-440891d3a0fd	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	saml-role-list-mapper
54387b51-8b99-462a-84a9-5ee1a4fe470a	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	oidc-full-name-mapper
1b4a9d9a-db15-415b-8d91-4b1b2c8ccbe7	e902768c-653a-4629-9254-1e9e439adffd	allowed-protocol-mapper-types	oidc-address-mapper
419f80cb-8516-4a7b-9f95-4f31f254ddcb	c66e706b-c963-4bcf-ac08-0b99fd5c3eb3	allow-default-scopes	true
40dcd8bc-b9f4-457d-8889-1e2f101989c2	01cebd7a-4868-41f2-809b-e49c1f1ddb6e	client-uris-must-match	true
c50ff970-eca5-4a2f-ac7e-bc3ccdd46d12	01cebd7a-4868-41f2-809b-e49c1f1ddb6e	host-sending-registration-request-must-match	true
25858a1d-5fba-4dd5-800b-71ee07fbad7d	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	oidc-full-name-mapper
89756ad3-fe15-4045-9da8-c60c3f2799fe	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	saml-role-list-mapper
8943db0b-206f-4d38-b62e-876b038fbbcf	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
79ef09b3-e8c1-40ab-b1f6-6821aeae1996	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
4960432d-cce0-436a-a918-889dcc3cf336	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	saml-user-attribute-mapper
36639a64-2c2c-4acc-abde-a953fe2e7347	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	oidc-address-mapper
2d268b7a-1171-4c13-ba3c-2520b008d9fc	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
29484c10-5053-4c77-a10f-8b3d8d77f06b	4e4e0e46-bdbe-4670-a35d-0d896ad9ae3b	allowed-protocol-mapper-types	saml-user-property-mapper
7e38661a-2410-49e2-8afe-3fa0c29a1342	64512556-39b2-4da4-a809-72e4b79fcd38	kid	69feb5e8-6bfe-4fc5-bac9-b4f3a1e265c0
1fac9705-c392-4ff1-a5a2-936ee0a7d5b9	64512556-39b2-4da4-a809-72e4b79fcd38	priority	100
99d59cfb-9d78-405b-b988-c710f788e2e8	64512556-39b2-4da4-a809-72e4b79fcd38	algorithm	HS256
a2ff83c6-3330-4626-8e68-d51f8df173d4	64512556-39b2-4da4-a809-72e4b79fcd38	secret	vWuf10hp6s_bax7Eeevn7OJWT7Q37wAxAVV9JVdccRkjpwOAIJP-eJxkHmAT8FKtIzDiZ5nHNDQyay7dh2hyQQ
9329776c-256e-49f8-9ca8-4aeca5b6499d	10ab5cb4-2a63-4d36-bf42-309644d67aec	priority	100
83fdce8f-0f0e-4adc-a0c4-06b093c15690	10ab5cb4-2a63-4d36-bf42-309644d67aec	certificate	MIICmzCCAYMCBgFuizu7+TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTkxMTIwMjM1MTE4WhcNMjkxMTIwMjM1MjU4WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDTP7EYQUEQsiJ/H3oilD+EzoPQOMgT/vMgyjqiKPWbNK8WzvbgLv0aZV1/NL2Yzx9jN20SLFPMfwo5E2fvcJPQ5JNBN4fBh8gPRarEwXg1NTf0V5Ng/P5DdQE5KfLUQYUky60yvR/kE+6HnNMu/a7naAmVtz2lwdiZA/oi/4VWFh23mozq/KFpX0+ePlqXBXBYlnW7uowadpTr/4zxP5SFhzZA+qympv3kclsILTOk8umi67Ayce8okdBgoG6tjkP6kxgMYc37Q/dYNV0fIZtphAk48wR9SnIFHJkuYUCZOIQvsYtwmHAOgZE7wWSui4BOZum9qCCsZ8nlV2+9JMGDAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHICCN86mvNKexLS7jIZreeyVSv6pwUaDIIY+q+lBT2NVMwQ/Cny1sKrC/K4CLIuum+lQrlOxOuIMwFhxDiYDcZqW1F3HXSwMxCP8SyCCj+jbCUEMSawyhF62uMvllgjXmMTpOmbcFfsVOMzNZG9mA2nXoZvqLsrQAM8/1o6VT/2LchIR2yHJP3Ue254G4hsobpT5QOjM9sfGQQEUP6VuD29qZdKOqP+Cp55s8k4dIAcGgpkfxlKiMHeCHOV+A7//mwCDS+tYhOpqVvkSrXDIlqJ+geGulmsEjslMCDwCNQSY2mobPJLOFBd5ezMmRyay1GO4CxDitq0mABv77GKZGw=
891611ce-5e2c-4702-9729-e618479f6828	10ab5cb4-2a63-4d36-bf42-309644d67aec	privateKey	MIIEpAIBAAKCAQEA0z+xGEFBELIifx96IpQ/hM6D0DjIE/7zIMo6oij1mzSvFs724C79GmVdfzS9mM8fYzdtEixTzH8KORNn73CT0OSTQTeHwYfID0WqxMF4NTU39FeTYPz+Q3UBOSny1EGFJMutMr0f5BPuh5zTLv2u52gJlbc9pcHYmQP6Iv+FVhYdt5qM6vyhaV9Pnj5alwVwWJZ1u7qMGnaU6/+M8T+UhYc2QPqspqb95HJbCC0zpPLpouuwMnHvKJHQYKBurY5D+pMYDGHN+0P3WDVdHyGbaYQJOPMEfUpyBRyZLmFAmTiEL7GLcJhwDoGRO8FkrouATmbpvaggrGfJ5VdvvSTBgwIDAQABAoIBAAEPe8scYMA9tLCgrtNHnT4Eb2L3NgHrsLrEaSDxRbJexFY/+btMYRbl1V9TG3SN7aFo4NJLiKwpIxsAPvBTx1owG5EjPzo4fUeeWOod8oWJ29sNKX8+JeSezL/FtyNbpNh3cUok6ukRNIxXvDOrMFqXCh1HSzbuzzCNdY8Ba2DwPyXYyZQufSB96e7Kfqkt5IAb2T/n6PLmeKD7WBRxfJ41zgx5oVtZaabxRfXXULeJb8UI/aH7JUBEOW7rDW6QLC+Tw6M/eIW1iEQXzbI85y/DeakEOIbppbmdrfG5s9Y/UdUtKLdHO6qy9++AhqlXWBRqDHmP2QMCCmAeEtShxvkCgYEA8OJW7XbXmNqCAG6sDhDVUg9wH0aDMopUJ2fjHqFtFshBp4+KzT8tf0T7dcu2C4qBwdcghgcSLw1nn7AdJBAwctp47cygs8pqIvojREPCG5uyApJxcSa59KIXt9HTb2x3G7qCzAJ9c2wzjNDnyPwhGegl9nvzdbFBNfoFTV9hdLcCgYEA4IFHLqaraEgGOBJy0p0ZzVxUvuqWZJqzhhAxZFyb+bIMjbJ3Aag8zO+rGtZRX3brFMEWH0w6OGS3Q0DdR80jp01FkoHPSYQRGFrndvoIBR8B8HsGNdxDvPzFasXf3BuD3+bLO5abay3fB/Ea17cUetGIn4XtzVSX4mLNHe09xZUCgYEAjBjXvdx0n+3V1jKH1tZrewKHj2kPPQG+1/xP16zDKZDmvnF5pM2txGt2ZJhKFIRF21snC0xpgvwk3HctO6A+zU3LL2LnxClheV5JzJYr+qqe6WgKmmiPlnv/l2Vtt0w6KeJb2BNKqyqvAKMva3FYPx0Jl0WX30dsSdxT4SAsKhkCgYBl/3YmpMR1YVup9//A3m1NluhNwOjJFlv/ybWXAlg+7nyzl+RnlVbiSPU1ATABLlcJm9wAJjLBUkjMvliKeZH8PaghMubJYL4fkZVdwaUJJphL+KjOqZ8A6tqKcxIMv1d/zyyAiyFbZYDR6+GlJeGhFzd6Om/a/NbwnLDSKuoIrQKBgQDcBcYmpY57jXp3EPLEZAuDH3I22O+Bm7XXhPvrR3ZlFlpR7yQfRAvhg0Xviqzy6EkbRE3KT6Vb5DHr5RApgyyCbgpEZNHJTRBhUHZk1VueoLSCAllGgZUFshAMCbOtkqh1sVJ5st/BHGf68/oLPHvrUy51JMOsHhBjB3FfX17U9w==
77ee6141-7ec4-4036-bd3d-28f48f4ca653	993bb9dd-9c92-4b53-be30-2ab48cb1d465	secret	osGVpHaDGYZ_PoqNYLZ8XQ
15b64f25-4293-4e3b-8926-eb24f5e0f8aa	993bb9dd-9c92-4b53-be30-2ab48cb1d465	priority	100
40c518e6-700e-4b78-b59e-cb834cd9b570	993bb9dd-9c92-4b53-be30-2ab48cb1d465	kid	fa0086ed-2df3-4493-a76d-c8d28a7f7880
5adff0f4-7d26-478b-a4b8-424d85854f08	7ed97dc7-2574-47c0-b7f0-77c25d446882	secret	tYWcsV6RefcSlea_VO2hpDGYC7vvFayv7cp2H51ivKEsQpMCAFmpv3__5vz8EfCo1uxAlga5_h2DCkMZgMK0Yg
154d0d53-765c-45ac-bbea-fbc7df838f84	7ed97dc7-2574-47c0-b7f0-77c25d446882	priority	100
99f0a3ab-bb25-48ae-9374-9b1ba4d870fe	7ed97dc7-2574-47c0-b7f0-77c25d446882	algorithm	HS256
7e71cd93-c7ec-4d10-8f8e-c94e9e1285c7	7ed97dc7-2574-47c0-b7f0-77c25d446882	kid	0daf5e29-5559-4c60-9666-04900b779560
c30b4664-9f9b-4806-a49a-20c75dfcf2b0	46f201d9-8df3-451e-9594-642b7312d59f	priority	100
8dd27971-8a34-49fa-93d6-a15b280035a9	46f201d9-8df3-451e-9594-642b7312d59f	secret	4g4-YJZCnqUcNTs0M4c6TQ
03dd7211-b84f-4b8c-b41d-c824d1e25b0b	46f201d9-8df3-451e-9594-642b7312d59f	kid	f2b13b86-dda8-452d-87ff-6226d00c1235
2b16dc75-7dda-40ff-8aab-0691c96f3a5c	72e865ff-0079-40e8-b1b8-2bcd84c92840	privateKey	MIIEpAIBAAKCAQEAmHNC/juzQjPIWZjOp24MC6kNn4vjFFTE6y6DeooagoKfAc02T77Sgsoxn0yNI21TDIGkfUB3OoEdo2QZO+Jwl0yo50xElQxokHvETSqSlywPvpb1QdXoJoWddzJpe9B4z/QraWwcAzHRXWNXWb9k+5KWm0yDSsuh7zbSICUxnir9+h4T7syOhnyvQmqoRZ1mXaTCebwhSiNxMTkBHsa4wE21Ml19hmEmhqSnmXTvgcYXns3MWGMtEIu9uxAy9Ifx72xl6BPZsuVZLHEjklu+cjgR0URgBewooPiGS2uTWvFHHdu07a1Ie6qGzDbq9Y/wkGqSDLwUzvnrPZ8Y/5emRwIDAQABAoIBADFL1DXxiB24MOkICIsLgsmieM1Gpr9ESgjimZFeZwQcyN4ERbOzuM6iIzmnv1vdViWNJmt6FRPN/I+BJse+iTnjiBqDBwpLYOSXoPpy8cQAc3blyZjoWpFaU3jfzExFNUvJYOBOHSDLUzAnl29l/Hl9BUZij3H4NvzrdTb/z/Oc3+33ImpsFcsCDGUUANl32OTkgqNOTc7FKbB2ynFgeDINQsGXW+rA3XcpDnqkuIvUDmEVCLG0NPq+sn+Tc3IAOz2QtI9HP1nRag8/HL+XnlXDcvoB4mecFyLpel5x4SkOueAcyfQDOBNEX3pW7/dUenY1ICQT01iT+t4EOCCg10ECgYEA+p+/YhuEacdpSG+8nLzDVuvxC6j+/93gG0zGr8ssDT+cU/4fFwfOA4SOHLBFs3qkbIsdWazxOL4m2h+3wuqEb2r4J1VjZxxwVOAtWTqMLpe3y0SizXGeFJvFORs+ZVxqr430QYYbYNZ/e9JaTGMxpxpz9a8MKYv6lbmtautH3fsCgYEAm7hpg4QOD2ZcqYPpyzPliC/r3iZygsZkekH9DtYIh+ico/8Q6bTULEkKM4De/AueNfvHIw2rRye7ON1HZHkbBtgxiXgp8OI2u89LeS5Mo7JG9X+4IhJwTdK/LDwbyghiacTITsSrLNuel2jrqt2xqnSEyd518RqDZk6DVtnt4yUCgYEA7i8b59VXBmCpwlnO2vbafqVFNFur3Oe0sL1Kpo9kkkK+A2UjjvOv6s/zb3hnBaes1Ctx/WPK7K5qpio2rlvK+UikBl20Vq5EY6WZ848c4rr1xYy5XJ56KgPQb/FgX1xxV96FIDCfnGy+Q6MqhiZPbgxJ4Fg4KtQJlnocQdzRNDkCgYALmZcyltm9R/DLJ+p4mqsUlA1MBS0ulLzTZqsFOeh0x10z0kJeRnwvuFksMQNrXyov90uETvZdXJZTzBgPYf4jamN2TB9DtHZDU1PZ+Rr4bsVecF81Go6HHZXkI64mRK2gF2qcg4YE129e9A/qMI2Vlwx1RT8f8MutCVg7VgykiQKBgQDy20cNlVmjqOvbABmDVq1Ta3vDS+PrETxJXiHXzdRxGW31Ak0ubtAYOqI/jdciXnJ3zD07gAInquLHM1nuvD1NaesqcRPwpJQUgAejiBuOT3mgzve2w/AcZe+11NxbPFdISgx7ZLx8F67VvVM6KCy2MAzouqt0dI1pWHULHdjCPw==
dfff2ec5-e3a5-434a-8324-082d0bfae7da	72e865ff-0079-40e8-b1b8-2bcd84c92840	priority	100
914769d2-db65-45c6-aecc-fab3cfb0a5bf	72e865ff-0079-40e8-b1b8-2bcd84c92840	certificate	MIIClzCCAX8CBgFwjh1wFTANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDAREZW1vMB4XDTIwMDIyODIzMjIzOFoXDTMwMDIyODIzMjQxOFowDzENMAsGA1UEAwwERGVtbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJhzQv47s0IzyFmYzqduDAupDZ+L4xRUxOsug3qKGoKCnwHNNk++0oLKMZ9MjSNtUwyBpH1AdzqBHaNkGTvicJdMqOdMRJUMaJB7xE0qkpcsD76W9UHV6CaFnXcyaXvQeM/0K2lsHAMx0V1jV1m/ZPuSlptMg0rLoe820iAlMZ4q/foeE+7MjoZ8r0JqqEWdZl2kwnm8IUojcTE5AR7GuMBNtTJdfYZhJoakp5l074HGF57NzFhjLRCLvbsQMvSH8e9sZegT2bLlWSxxI5JbvnI4EdFEYAXsKKD4hktrk1rxRx3btO2tSHuqhsw26vWP8JBqkgy8FM756z2fGP+XpkcCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAAa/GXKOiD3spkNEXc6x6Lhv+aQL1KKAhXl87XeviVY+fjoWUXWGxWgDJlh8f6TOYTjxyrpT4luC/oxt4Yubn9+3V0R/riC88+pk5ILA77HW88uHsEJIx+aYr328rihFwCy+OGVz9uissU2r1x5BsZUkbrd4UEF9Vn2y87AvZm+WafPDpvECSF+PTEHEblbyxh4GDSMHHBPDKcic4dHjblaPIfEisJCliALT1oxTbGno8G4EBss07/oCeQAUPB7Gg7BPta874m5Fl7rWxTHAk/D9cmAX0TvkAf4kFGXj2e/HE/Hp+AcvGPAWjFG7ctv4l2H6bmOnwXb8gWWf8KR9abg==
3f65d5a1-7d86-44d8-a477-e82aeb64e26c	a76a83bb-acf1-45f8-80e2-a5deff660ce2	allow-default-scopes	true
e326102d-aaad-4021-afc2-04ac7bca1aad	4bf56820-40b7-43de-94d6-afa15eaedcd2	host-sending-registration-request-must-match	true
ba3e5aa9-6006-4dcb-aa77-581529ec307e	4bf56820-40b7-43de-94d6-afa15eaedcd2	client-uris-must-match	true
c01cbad6-30e3-4827-8f99-66600b5659f4	b5632cf8-9faa-463e-a75d-d3f5ad2a7b2b	max-clients	200
acdf8728-75a3-434e-b00d-032787833dd7	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	saml-user-attribute-mapper
7b524f64-d531-43b3-9fbe-45699eca411f	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	saml-role-list-mapper
1d1d662b-94f4-4d7c-a45c-cd008f8859be	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	oidc-full-name-mapper
074a061f-2357-4786-8252-31c6fbb25fe5	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
573b1347-5a7f-4d5b-a9c0-636d5ff87bc4	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
8804ea6f-390c-4b9e-9cb3-085778ad49d9	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
588cec83-bafd-413a-af36-75945fa9d940	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	saml-user-property-mapper
774f7698-6890-493b-a752-010c47a4dfca	33a1eda6-e2c8-4987-a33a-038524b93687	allowed-protocol-mapper-types	oidc-address-mapper
bce6fac6-3f37-4aa5-80a9-a67b474ddcbe	87ceb9c6-3494-48e6-a4ea-8bb47dc2eeb4	allow-default-scopes	true
ee0b2b0a-394a-4bbe-89dd-cdd06bff9af4	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	saml-user-property-mapper
82408d3b-70d2-4096-a4a6-ae379d43c090	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ba1898cf-9623-4bde-9c14-91afc558df0b	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	saml-role-list-mapper
0b9d1af4-1305-45e9-97fe-29262016cb3f	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	saml-user-attribute-mapper
08d0a092-8a98-4984-8c62-07bdf0006fcd	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	oidc-full-name-mapper
330c0843-3455-4bc7-9de9-d6dd68cb634c	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	oidc-address-mapper
5154d089-ea8a-4777-b174-bd514529c754	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
08e8503a-ba97-4570-b631-2f3b0f306900	10d61a6f-b9cb-4488-a4cc-7dda6b78362a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	c3243687-61b6-40d1-a0d9-64a8e4e41bbc
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	b1855ecd-da4f-4fe4-9846-4524e1a1e6ee
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	8a6cb2bf-ee00-491e-aeac-1e7d754eb61c
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	3142b931-e5f5-46a1-b554-c59029796d56
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	ac005495-bc34-405b-b8fe-659a59ce8de7
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	d6cbb155-8be2-4724-8717-a0a86dd6bf40
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	74e7bc92-c464-4a68-8592-cc08be6e1822
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	23ddccbb-7790-44ec-8f23-b0d483e78993
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	ad7ec9cf-7fa8-4a12-b3f2-703e34a276b5
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	c8a83d61-7165-4676-a8c5-b99d08936bb7
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	1bd849e8-de31-4541-bf36-edddcff4a9b8
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	f251565c-a487-41f4-8fba-c7b1e99cf39b
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	3397db60-0b0c-4e0c-91f7-602e7659f753
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	181072e2-b785-4b1a-ad90-08b517985e0c
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	23247600-f95d-4ad9-b200-61d904d38971
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	d4b3329f-2679-43b9-86bd-7bb8868ef5ab
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	6f8ef701-503f-4405-8903-bde634da10a4
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	afc19689-df3e-4062-be28-24bc442c5acc
3142b931-e5f5-46a1-b554-c59029796d56	afc19689-df3e-4062-be28-24bc442c5acc
3142b931-e5f5-46a1-b554-c59029796d56	23247600-f95d-4ad9-b200-61d904d38971
ac005495-bc34-405b-b8fe-659a59ce8de7	d4b3329f-2679-43b9-86bd-7bb8868ef5ab
c7246f7f-b1c2-483f-af90-f4313ce17662	74c8993a-16d2-4ed2-899b-30e311a1985b
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	489dc9ef-b360-4aa5-842e-ab7d15bd9169
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	c8bdab80-62ac-4532-bf9e-ce69574426d3
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	05935566-9bba-43e1-bf6b-c5ad1ef34b23
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	8435c26e-d0c8-447f-9ffc-8f41d57417ae
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	e74bd7aa-edc5-4aa9-8933-e350515616cb
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	047af7e7-d563-48b2-bc5c-eb8b7d257809
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	eb6f4eaa-068e-4afb-8e68-8f04b866accb
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	5bd278f2-eff5-4e80-a510-80cc42a6b925
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	49a85c40-ae02-4ec8-9d30-f43c1a98958d
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	9498ff34-1920-4b0e-8bdd-5634d2d3d158
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	e015d9b5-a641-4e3f-8c0c-f221c4046207
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	2963febc-2c47-41b6-9363-dfdd45eeb620
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	cc9e0854-e9d3-44c9-b833-e1bc7f884c2a
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	b0f5a92f-0491-4a74-b9bf-26f0f1e0b64b
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	f95276d6-6a91-424e-b560-4de6b5385c65
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	78ffafb7-cf15-43e4-8af8-5b891e1c133d
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	1ccf82a5-1d54-48d9-a174-72c158caa0dc
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	5602d46c-31fe-4fad-8666-2cac3ad9abe2
8435c26e-d0c8-447f-9ffc-8f41d57417ae	5602d46c-31fe-4fad-8666-2cac3ad9abe2
8435c26e-d0c8-447f-9ffc-8f41d57417ae	f95276d6-6a91-424e-b560-4de6b5385c65
e74bd7aa-edc5-4aa9-8933-e350515616cb	78ffafb7-cf15-43e4-8af8-5b891e1c133d
53d47151-a515-46b4-be2f-3f3c408cfc90	05a79c7e-b474-4b77-9827-13ece1bbb894
53d47151-a515-46b4-be2f-3f3c408cfc90	5e00f458-3b0d-4b33-883e-d3b77bea435d
53d47151-a515-46b4-be2f-3f3c408cfc90	58246ec3-8fdc-4385-91aa-6cf8065fdd42
53d47151-a515-46b4-be2f-3f3c408cfc90	9c4c1675-4bf1-47cd-90ab-6652f45afe5b
53d47151-a515-46b4-be2f-3f3c408cfc90	c22505e8-22d5-427b-bd59-13d0e42ef91b
53d47151-a515-46b4-be2f-3f3c408cfc90	80e7eb54-f0ed-4a34-8f4b-9d67fbc63eb8
53d47151-a515-46b4-be2f-3f3c408cfc90	886322b5-82bd-4840-a382-4e5ccfa5eaae
53d47151-a515-46b4-be2f-3f3c408cfc90	ac4a8049-5f2a-4203-ba5f-ff9ce48768cc
53d47151-a515-46b4-be2f-3f3c408cfc90	77e84029-d5fd-446c-ad1f-241f85b0fb7b
53d47151-a515-46b4-be2f-3f3c408cfc90	6cf98b28-0d43-4532-9d4e-6f794616035d
53d47151-a515-46b4-be2f-3f3c408cfc90	d0a7d3a3-261a-4425-a7fe-d6849bc5b1a2
53d47151-a515-46b4-be2f-3f3c408cfc90	0ab5d798-a038-40a6-9735-0d69e1b4dc02
53d47151-a515-46b4-be2f-3f3c408cfc90	bafa9b34-c560-4115-9600-9c770c41fcca
53d47151-a515-46b4-be2f-3f3c408cfc90	6cf6a0f5-b59a-4926-b5c7-afabbcb8a812
53d47151-a515-46b4-be2f-3f3c408cfc90	2910f51d-4c5a-4a2b-a920-ce1f71b16bea
53d47151-a515-46b4-be2f-3f3c408cfc90	c0db03b1-1483-455c-ab28-186415b993e4
53d47151-a515-46b4-be2f-3f3c408cfc90	6d972a54-e8e8-4208-8a59-0ca892e745a0
58246ec3-8fdc-4385-91aa-6cf8065fdd42	6cf6a0f5-b59a-4926-b5c7-afabbcb8a812
58246ec3-8fdc-4385-91aa-6cf8065fdd42	6d972a54-e8e8-4208-8a59-0ca892e745a0
9c4c1675-4bf1-47cd-90ab-6652f45afe5b	2910f51d-4c5a-4a2b-a920-ce1f71b16bea
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	b4c2a1a9-3114-4c99-bd6f-e1a9b2417e54
d3def975-64e1-4a24-b969-9dcb7221acb4	b8ac713d-ede1-4e3d-b3d8-11ee9dadde4f
53d47151-a515-46b4-be2f-3f3c408cfc90	52c5732f-2566-4a96-89e5-bfc6e4a000fc
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, device, hash_iterations, salt, type, value, user_id, created_date, counter, digits, period, algorithm) FROM stdin;
f59e262e-b040-4a1e-8994-c90e04ef40cb	\N	27500	\\x48b140ac958362a344a7f84ab136349a	password	A5gO313tdmgGzfUg+1cilpSQFh2KLzBPG4spolYrsG2CNOOye2ZaoVsAfQkk0j4TS9+CAQKuf7RRWphXWKVxPQ==	5de7b491-8494-40d4-bf0b-4b682bab5acb	\N	0	0	0	pbkdf2-sha256
bb984821-a0ba-4f55-8d9d-b4f606cdf37d	\N	27500	\\xd821238e9451d578cda80e02b35061d2	password	OVBjwASKKQKyhxMf/f1+RQreg4jmPrcLHtI5VDKMKk6xl6TXaU9ERlCDLqHS0Bz+mkY0l4jW+a26USoQ8I7zEA==	92582c83-e6a2-4ab8-82fc-323261175339	1582933056596	0	0	0	pbkdf2-sha256
\.


--
-- Data for Name: credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2019-11-20 23:52:49.071863	1	EXECUTED	7:4e70412f24a3f382c82183742ec79317	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	4293968726
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2019-11-20 23:52:49.094405	2	MARK_RAN	7:cb16724583e9675711801c6875114f28	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	3.5.4	\N	\N	4293968726
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2019-11-20 23:52:49.154459	3	EXECUTED	7:0310eb8ba07cec616460794d42ade0fa	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	3.5.4	\N	\N	4293968726
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2019-11-20 23:52:49.159997	4	EXECUTED	7:5d25857e708c3233ef4439df1f93f012	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	3.5.4	\N	\N	4293968726
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2019-11-20 23:52:49.280063	5	EXECUTED	7:c7a54a1041d58eb3817a4a883b4d4e84	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	4293968726
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2019-11-20 23:52:49.287152	6	MARK_RAN	7:2e01012df20974c1c2a605ef8afe25b7	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	3.5.4	\N	\N	4293968726
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2019-11-20 23:52:49.376412	7	EXECUTED	7:0f08df48468428e0f30ee59a8ec01a41	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	4293968726
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2019-11-20 23:52:49.381599	8	MARK_RAN	7:a77ea2ad226b345e7d689d366f185c8c	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	3.5.4	\N	\N	4293968726
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2019-11-20 23:52:49.38899	9	EXECUTED	7:a3377a2059aefbf3b90ebb4c4cc8e2ab	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	3.5.4	\N	\N	4293968726
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2019-11-20 23:52:49.487781	10	EXECUTED	7:04c1dbedc2aa3e9756d1a1668e003451	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	3.5.4	\N	\N	4293968726
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2019-11-20 23:52:49.548321	11	EXECUTED	7:36ef39ed560ad07062d956db861042ba	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4293968726
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2019-11-20 23:52:49.552338	12	MARK_RAN	7:d909180b2530479a716d3f9c9eaea3d7	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4293968726
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2019-11-20 23:52:49.572328	13	EXECUTED	7:cf12b04b79bea5152f165eb41f3955f6	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	3.5.4	\N	\N	4293968726
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-20 23:52:49.59835	14	EXECUTED	7:7e32c8f05c755e8675764e7d5f514509	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	3.5.4	\N	\N	4293968726
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-20 23:52:49.604208	15	MARK_RAN	7:980ba23cc0ec39cab731ce903dd01291	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	4293968726
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-20 23:52:49.606985	16	MARK_RAN	7:2fa220758991285312eb84f3b4ff5336	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	3.5.4	\N	\N	4293968726
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2019-11-20 23:52:49.609871	17	EXECUTED	7:d41d8cd98f00b204e9800998ecf8427e	empty		\N	3.5.4	\N	\N	4293968726
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2019-11-20 23:52:49.67493	18	EXECUTED	7:91ace540896df890cc00a0490ee52bbc	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	3.5.4	\N	\N	4293968726
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2019-11-20 23:52:49.729411	19	EXECUTED	7:c31d1646dfa2618a9335c00e07f89f24	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	4293968726
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2019-11-20 23:52:49.750084	20	EXECUTED	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	4293968726
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-20 23:52:50.339998	45	EXECUTED	7:6a48ce645a3525488a90fbf76adf3bb3	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	4293968726
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2019-11-20 23:52:49.761004	21	MARK_RAN	7:f987971fe6b37d963bc95fee2b27f8df	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	3.5.4	\N	\N	4293968726
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2019-11-20 23:52:49.774199	22	MARK_RAN	7:df8bc21027a4f7cbbb01f6344e89ce07	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	3.5.4	\N	\N	4293968726
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2019-11-20 23:52:49.802708	23	EXECUTED	7:ed2dc7f799d19ac452cbcda56c929e47	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	3.5.4	\N	\N	4293968726
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2019-11-20 23:52:49.808562	24	EXECUTED	7:80b5db88a5dda36ece5f235be8757615	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	4293968726
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2019-11-20 23:52:49.810854	25	MARK_RAN	7:1437310ed1305a9b93f8848f301726ce	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	3.5.4	\N	\N	4293968726
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2019-11-20 23:52:49.845847	26	EXECUTED	7:b82ffb34850fa0836be16deefc6a87c4	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	3.5.4	\N	\N	4293968726
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2019-11-20 23:52:49.946829	27	EXECUTED	7:9cc98082921330d8d9266decdd4bd658	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	3.5.4	\N	\N	4293968726
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2019-11-20 23:52:49.95175	28	EXECUTED	7:03d64aeed9cb52b969bd30a7ac0db57e	update tableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	4293968726
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2019-11-20 23:52:50.039043	29	EXECUTED	7:f1f9fd8710399d725b780f463c6b21cd	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	3.5.4	\N	\N	4293968726
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2019-11-20 23:52:50.056224	30	EXECUTED	7:53188c3eb1107546e6f765835705b6c1	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	3.5.4	\N	\N	4293968726
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2019-11-20 23:52:50.078508	31	EXECUTED	7:d6e6f3bc57a0c5586737d1351725d4d4	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	3.5.4	\N	\N	4293968726
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2019-11-20 23:52:50.087055	32	EXECUTED	7:454d604fbd755d9df3fd9c6329043aa5	customChange		\N	3.5.4	\N	\N	4293968726
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-20 23:52:50.09388	33	EXECUTED	7:57e98a3077e29caf562f7dbf80c72600	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	3.5.4	\N	\N	4293968726
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-20 23:52:50.09643	34	MARK_RAN	7:e4c7e8f2256210aee71ddc42f538b57a	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	4293968726
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-20 23:52:50.138649	35	EXECUTED	7:09a43c97e49bc626460480aa1379b522	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	3.5.4	\N	\N	4293968726
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2019-11-20 23:52:50.154324	36	EXECUTED	7:26bfc7c74fefa9126f2ce702fb775553	addColumn tableName=REALM		\N	3.5.4	\N	\N	4293968726
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2019-11-20 23:52:50.162535	37	EXECUTED	7:a161e2ae671a9020fff61e996a207377	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	3.5.4	\N	\N	4293968726
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2019-11-20 23:52:50.167414	38	EXECUTED	7:37fc1781855ac5388c494f1442b3f717	addColumn tableName=FED_USER_CONSENT		\N	3.5.4	\N	\N	4293968726
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2019-11-20 23:52:50.171603	39	EXECUTED	7:13a27db0dae6049541136adad7261d27	addColumn tableName=IDENTITY_PROVIDER		\N	3.5.4	\N	\N	4293968726
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-20 23:52:50.173957	40	MARK_RAN	7:550300617e3b59e8af3a6294df8248a3	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	4293968726
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-20 23:52:50.176967	41	MARK_RAN	7:e3a9482b8931481dc2772a5c07c44f17	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	3.5.4	\N	\N	4293968726
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2019-11-20 23:52:50.186315	42	EXECUTED	7:72b07d85a2677cb257edb02b408f332d	customChange		\N	3.5.4	\N	\N	4293968726
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2019-11-20 23:52:50.325949	43	EXECUTED	7:a72a7858967bd414835d19e04d880312	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	3.5.4	\N	\N	4293968726
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2019-11-20 23:52:50.332631	44	EXECUTED	7:94edff7cf9ce179e7e85f0cd78a3cf2c	addColumn tableName=USER_ENTITY		\N	3.5.4	\N	\N	4293968726
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-20 23:52:50.345958	46	EXECUTED	7:e64b5dcea7db06077c6e57d3b9e5ca14	customChange		\N	3.5.4	\N	\N	4293968726
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-20 23:52:50.348512	47	MARK_RAN	7:fd8cf02498f8b1e72496a20afc75178c	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	3.5.4	\N	\N	4293968726
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-20 23:52:50.389898	48	EXECUTED	7:542794f25aa2b1fbabb7e577d6646319	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	3.5.4	\N	\N	4293968726
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2019-11-20 23:52:50.396048	49	EXECUTED	7:edad604c882df12f74941dac3cc6d650	addColumn tableName=REALM		\N	3.5.4	\N	\N	4293968726
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2019-11-20 23:52:50.442115	50	EXECUTED	7:0f88b78b7b46480eb92690cbf5e44900	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	3.5.4	\N	\N	4293968726
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2019-11-20 23:52:50.476234	51	EXECUTED	7:d560e43982611d936457c327f872dd59	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	3.5.4	\N	\N	4293968726
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2019-11-20 23:52:50.48064	52	EXECUTED	7:c155566c42b4d14ef07059ec3b3bbd8e	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	3.5.4	\N	\N	4293968726
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2019-11-20 23:52:50.484935	53	EXECUTED	7:b40376581f12d70f3c89ba8ddf5b7dea	update tableName=REALM		\N	3.5.4	\N	\N	4293968726
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2019-11-20 23:52:50.488645	54	EXECUTED	7:a1132cc395f7b95b3646146c2e38f168	update tableName=CLIENT		\N	3.5.4	\N	\N	4293968726
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-20 23:52:50.496667	55	EXECUTED	7:d8dc5d89c789105cfa7ca0e82cba60af	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	3.5.4	\N	\N	4293968726
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-20 23:52:50.504349	56	EXECUTED	7:7822e0165097182e8f653c35517656a3	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	3.5.4	\N	\N	4293968726
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-20 23:52:50.530364	57	EXECUTED	7:c6538c29b9c9a08f9e9ea2de5c2b6375	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	3.5.4	\N	\N	4293968726
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2019-11-20 23:52:50.644866	58	EXECUTED	7:6d4893e36de22369cf73bcb051ded875	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	3.5.4	\N	\N	4293968726
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2019-11-20 23:52:50.672447	59	EXECUTED	7:57960fc0b0f0dd0563ea6f8b2e4a1707	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	3.5.4	\N	\N	4293968726
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2019-11-20 23:52:50.677784	60	EXECUTED	7:2b4b8bff39944c7097977cc18dbceb3b	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	3.5.4	\N	\N	4293968726
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-11-20 23:52:50.68627	61	EXECUTED	7:2aa42a964c59cd5b8ca9822340ba33a8	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	3.5.4	\N	\N	4293968726
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2019-11-20 23:52:50.691606	62	EXECUTED	7:9ac9e58545479929ba23f4a3087a0346	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	3.5.4	\N	\N	4293968726
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2019-11-20 23:52:50.695219	63	EXECUTED	7:14d407c35bc4fe1976867756bcea0c36	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	4293968726
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2019-11-20 23:52:50.698358	64	EXECUTED	7:241a8030c748c8548e346adee548fa93	update tableName=REQUIRED_ACTION_PROVIDER		\N	3.5.4	\N	\N	4293968726
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2019-11-20 23:52:50.701047	65	EXECUTED	7:7d3182f65a34fcc61e8d23def037dc3f	update tableName=RESOURCE_SERVER_RESOURCE		\N	3.5.4	\N	\N	4293968726
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2019-11-20 23:52:50.71444	66	EXECUTED	7:b30039e00a0b9715d430d1b0636728fa	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	3.5.4	\N	\N	4293968726
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2019-11-20 23:52:50.720144	67	EXECUTED	7:3797315ca61d531780f8e6f82f258159	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	3.5.4	\N	\N	4293968726
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2019-11-20 23:52:50.724124	68	EXECUTED	7:c7aa4c8d9573500c2d347c1941ff0301	addColumn tableName=REALM		\N	3.5.4	\N	\N	4293968726
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2019-11-20 23:52:50.733897	69	EXECUTED	7:b207faee394fc074a442ecd42185a5dd	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	3.5.4	\N	\N	4293968726
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2019-11-20 23:52:50.739708	70	EXECUTED	7:ab9a9762faaba4ddfa35514b212c4922	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	3.5.4	\N	\N	4293968726
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2019-11-20 23:52:50.743824	71	EXECUTED	7:b9710f74515a6ccb51b72dc0d19df8c4	addColumn tableName=RESOURCE_SERVER		\N	3.5.4	\N	\N	4293968726
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
master	ca391498-4e4d-433a-8521-a8769c450749	f
master	1e6f0147-2981-49f0-a565-225a69940079	t
master	2627a628-a071-40b3-ab5f-457038793e07	t
master	7deece3e-6ed7-4f6c-91c0-b6e550199b70	t
master	333435db-7853-4e29-b4d8-d8b808c11a2a	f
master	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68	f
master	49ab8431-58a3-4877-963e-37bcafebe0d1	t
master	44208e16-8fdd-4d66-8bbe-a50d115aca27	t
master	c75879b2-fae2-4301-9a0a-658c8ed49a58	f
Demo	12006cb0-fd68-4f7c-ab30-1d9dd84c9d56	f
Demo	62349c73-be99-47ed-8d40-7339a875e429	t
Demo	a7d87e5e-d029-433f-b38a-837f84489caf	t
Demo	f61c4983-6312-48c9-88f2-900638f9b194	t
Demo	d4ae4769-54a6-4dbf-86e5-1027a9612e43	f
Demo	8dc9e1df-653f-438f-800e-d83278df7ca7	f
Demo	59dca199-ddf4-4f54-9216-52f1684fdc97	t
Demo	93ef66e9-ee76-4d1f-be25-6b3871960552	t
Demo	bf41b9a1-2368-410e-85b3-cb17ce5eaa96	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_credential_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_credential_attribute (id, credential_id, name, value) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, device, hash_iterations, salt, type, value, created_date, counter, digits, period, algorithm, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	master	f	${role_admin}	admin	master	\N	master
c3243687-61b6-40d1-a0d9-64a8e4e41bbc	master	f	${role_create-realm}	create-realm	master	\N	master
b1855ecd-da4f-4fe4-9846-4524e1a1e6ee	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_create-client}	create-client	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
8a6cb2bf-ee00-491e-aeac-1e7d754eb61c	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-realm}	view-realm	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
3142b931-e5f5-46a1-b554-c59029796d56	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-users}	view-users	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
ac005495-bc34-405b-b8fe-659a59ce8de7	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-clients}	view-clients	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
d6cbb155-8be2-4724-8717-a0a86dd6bf40	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-events}	view-events	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
74e7bc92-c464-4a68-8592-cc08be6e1822	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-identity-providers}	view-identity-providers	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
23ddccbb-7790-44ec-8f23-b0d483e78993	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_view-authorization}	view-authorization	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
ad7ec9cf-7fa8-4a12-b3f2-703e34a276b5	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-realm}	manage-realm	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
c8a83d61-7165-4676-a8c5-b99d08936bb7	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-users}	manage-users	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
1bd849e8-de31-4541-bf36-edddcff4a9b8	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-clients}	manage-clients	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
f251565c-a487-41f4-8fba-c7b1e99cf39b	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-events}	manage-events	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
3397db60-0b0c-4e0c-91f7-602e7659f753	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-identity-providers}	manage-identity-providers	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
181072e2-b785-4b1a-ad90-08b517985e0c	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_manage-authorization}	manage-authorization	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
23247600-f95d-4ad9-b200-61d904d38971	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_query-users}	query-users	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
d4b3329f-2679-43b9-86bd-7bb8868ef5ab	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_query-clients}	query-clients	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
6f8ef701-503f-4405-8903-bde634da10a4	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_query-realms}	query-realms	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
afc19689-df3e-4062-be28-24bc442c5acc	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_query-groups}	query-groups	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
2fe57b70-4fee-4280-bbed-2ba16847bd6e	34304f4f-a3f7-4302-9e71-eecd04c640d0	t	${role_view-profile}	view-profile	master	34304f4f-a3f7-4302-9e71-eecd04c640d0	\N
c7246f7f-b1c2-483f-af90-f4313ce17662	34304f4f-a3f7-4302-9e71-eecd04c640d0	t	${role_manage-account}	manage-account	master	34304f4f-a3f7-4302-9e71-eecd04c640d0	\N
74c8993a-16d2-4ed2-899b-30e311a1985b	34304f4f-a3f7-4302-9e71-eecd04c640d0	t	${role_manage-account-links}	manage-account-links	master	34304f4f-a3f7-4302-9e71-eecd04c640d0	\N
c8370491-4eea-4818-b314-ae9793297d3b	07477098-d643-494c-b286-1e92918c14ac	t	${role_read-token}	read-token	master	07477098-d643-494c-b286-1e92918c14ac	\N
489dc9ef-b360-4aa5-842e-ab7d15bd9169	921e2f83-96b2-4f85-8f09-bf63e686a387	t	${role_impersonation}	impersonation	master	921e2f83-96b2-4f85-8f09-bf63e686a387	\N
937853b7-42b3-46d9-a490-a4eb425153be	master	f	${role_offline-access}	offline_access	master	\N	master
6d558a6f-6807-4ef7-bd8b-ed8cff9afd89	master	f	${role_uma_authorization}	uma_authorization	master	\N	master
c8bdab80-62ac-4532-bf9e-ce69574426d3	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_create-client}	create-client	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
05935566-9bba-43e1-bf6b-c5ad1ef34b23	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-realm}	view-realm	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
8435c26e-d0c8-447f-9ffc-8f41d57417ae	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-users}	view-users	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
e74bd7aa-edc5-4aa9-8933-e350515616cb	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-clients}	view-clients	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
047af7e7-d563-48b2-bc5c-eb8b7d257809	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-events}	view-events	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
eb6f4eaa-068e-4afb-8e68-8f04b866accb	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-identity-providers}	view-identity-providers	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
5bd278f2-eff5-4e80-a510-80cc42a6b925	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_view-authorization}	view-authorization	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
49a85c40-ae02-4ec8-9d30-f43c1a98958d	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-realm}	manage-realm	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
9498ff34-1920-4b0e-8bdd-5634d2d3d158	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-users}	manage-users	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
e015d9b5-a641-4e3f-8c0c-f221c4046207	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-clients}	manage-clients	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
2963febc-2c47-41b6-9363-dfdd45eeb620	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-events}	manage-events	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
cc9e0854-e9d3-44c9-b833-e1bc7f884c2a	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-identity-providers}	manage-identity-providers	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
b0f5a92f-0491-4a74-b9bf-26f0f1e0b64b	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_manage-authorization}	manage-authorization	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
f95276d6-6a91-424e-b560-4de6b5385c65	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_query-users}	query-users	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
78ffafb7-cf15-43e4-8af8-5b891e1c133d	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_query-clients}	query-clients	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
1ccf82a5-1d54-48d9-a174-72c158caa0dc	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_query-realms}	query-realms	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
5602d46c-31fe-4fad-8666-2cac3ad9abe2	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_query-groups}	query-groups	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
53d47151-a515-46b4-be2f-3f3c408cfc90	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_realm-admin}	realm-admin	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
05a79c7e-b474-4b77-9827-13ece1bbb894	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_create-client}	create-client	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
5e00f458-3b0d-4b33-883e-d3b77bea435d	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-realm}	view-realm	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
58246ec3-8fdc-4385-91aa-6cf8065fdd42	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-users}	view-users	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
9c4c1675-4bf1-47cd-90ab-6652f45afe5b	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-clients}	view-clients	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
c22505e8-22d5-427b-bd59-13d0e42ef91b	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-events}	view-events	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
80e7eb54-f0ed-4a34-8f4b-9d67fbc63eb8	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-identity-providers}	view-identity-providers	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
886322b5-82bd-4840-a382-4e5ccfa5eaae	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_view-authorization}	view-authorization	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
ac4a8049-5f2a-4203-ba5f-ff9ce48768cc	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-realm}	manage-realm	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
77e84029-d5fd-446c-ad1f-241f85b0fb7b	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-users}	manage-users	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
6cf98b28-0d43-4532-9d4e-6f794616035d	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-clients}	manage-clients	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
d0a7d3a3-261a-4425-a7fe-d6849bc5b1a2	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-events}	manage-events	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
0ab5d798-a038-40a6-9735-0d69e1b4dc02	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-identity-providers}	manage-identity-providers	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
bafa9b34-c560-4115-9600-9c770c41fcca	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_manage-authorization}	manage-authorization	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
6cf6a0f5-b59a-4926-b5c7-afabbcb8a812	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_query-users}	query-users	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
2910f51d-4c5a-4a2b-a920-ce1f71b16bea	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_query-clients}	query-clients	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
c0db03b1-1483-455c-ab28-186415b993e4	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_query-realms}	query-realms	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
6d972a54-e8e8-4208-8a59-0ca892e745a0	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_query-groups}	query-groups	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
3cf6e888-ae63-4b8e-b7ee-bdabe7d5ec0e	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	t	${role_view-profile}	view-profile	Demo	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	\N
d3def975-64e1-4a24-b969-9dcb7221acb4	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	t	${role_manage-account}	manage-account	Demo	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	\N
b8ac713d-ede1-4e3d-b3d8-11ee9dadde4f	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	t	${role_manage-account-links}	manage-account-links	Demo	574e2caf-cccd-4ca1-9e3a-08ab978dbad5	\N
b4c2a1a9-3114-4c99-bd6f-e1a9b2417e54	f5f980fe-2c9f-4f3a-ae05-65613a112afd	t	${role_impersonation}	impersonation	master	f5f980fe-2c9f-4f3a-ae05-65613a112afd	\N
52c5732f-2566-4a96-89e5-bfc6e4a000fc	803e6509-76e4-45b7-9d98-aeea827c94cb	t	${role_impersonation}	impersonation	Demo	803e6509-76e4-45b7-9d98-aeea827c94cb	\N
61359a33-87f3-470c-a2cb-f8912e0db4c2	3c582625-675a-4f89-87ec-ef6a400f4c9d	t	${role_read-token}	read-token	Demo	3c582625-675a-4f89-87ec-ef6a400f4c9d	\N
74dce7d6-1086-425c-ab42-c950e375ff5a	Demo	f	${role_offline-access}	offline_access	Demo	\N	Demo
65627dea-b983-403f-a0af-c3637bbaf083	Demo	f	${role_uma_authorization}	uma_authorization	Demo	\N	Demo
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version) FROM stdin;
SINGLETON	6.0.0
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	locale	openid-connect	oidc-usermodel-attribute-mapper	47c573b1-4c7b-4e30-8154-866c8055a8eb	\N
b9c16f61-bb87-4a70-be3e-4ca9502b79a4	role list	saml	saml-role-list-mapper	\N	1e6f0147-2981-49f0-a565-225a69940079
08e0b8e5-4039-4ff1-9e96-a2a6ca14f7e9	full name	openid-connect	oidc-full-name-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	family name	openid-connect	oidc-usermodel-property-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
b6062367-6b26-4da1-bd86-e73e33a56f13	given name	openid-connect	oidc-usermodel-property-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
4eab1ca0-7fab-4071-9435-55881628803e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
0c2c1007-450c-433d-8ad4-da670dd16a7e	username	openid-connect	oidc-usermodel-property-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
90602b3c-4ec0-461d-a5bf-5acfb1608806	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	website	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
9d610dab-5c77-4e01-b18f-daf15ce2111d	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
416a7d4d-3e30-4276-a6e2-a241ad0da172	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
857442ae-ffea-4355-97e3-a4e777aba175	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
1e21ecb9-8872-4393-901c-b85554061008	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	2627a628-a071-40b3-ab5f-457038793e07
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	email	openid-connect	oidc-usermodel-property-mapper	\N	7deece3e-6ed7-4f6c-91c0-b6e550199b70
2967dd48-90c5-4a97-93bf-3b711deda243	email verified	openid-connect	oidc-usermodel-property-mapper	\N	7deece3e-6ed7-4f6c-91c0-b6e550199b70
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	address	openid-connect	oidc-address-mapper	\N	333435db-7853-4e29-b4d8-d8b808c11a2a
e1312a48-e368-4e75-9c0c-33e8c152a211	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68
8385a612-a2e2-492f-a647-d18705ff2bc9	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	8bab05b3-a4a9-46e7-a1d4-3340e44cfb68
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	49ab8431-58a3-4877-963e-37bcafebe0d1
0b64f679-c36f-4028-9a87-5a05b7f45d1e	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	49ab8431-58a3-4877-963e-37bcafebe0d1
b78b5648-5ef2-48b7-88a4-c43ef2cdb253	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	49ab8431-58a3-4877-963e-37bcafebe0d1
1976a16c-e1a0-4827-805b-846098a82807	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	44208e16-8fdd-4d66-8bbe-a50d115aca27
a2ee30b0-6c53-476b-88e0-73c240779562	upn	openid-connect	oidc-usermodel-property-mapper	\N	c75879b2-fae2-4301-9a0a-658c8ed49a58
267fe3b2-3c59-4007-a356-e5acd3cbd402	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	c75879b2-fae2-4301-9a0a-658c8ed49a58
65e62c01-e315-4bcc-891c-75a079ef7714	role list	saml	saml-role-list-mapper	\N	62349c73-be99-47ed-8d40-7339a875e429
242b789e-c4f8-4ec4-aca6-5201bc595a4d	full name	openid-connect	oidc-full-name-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
6901dc3a-0f9a-4de3-b583-8cc9652ec185	family name	openid-connect	oidc-usermodel-property-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	given name	openid-connect	oidc-usermodel-property-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
f09b150e-8b93-4b27-aa45-ca412ec53954	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
a2862497-61de-4d35-bf50-2a7433ee8ba4	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	username	openid-connect	oidc-usermodel-property-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
f0f69b40-3756-4268-b3dc-e24ef11143aa	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
cd4c10d9-04cc-41be-a4ad-53e417f15337	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
fdc20345-d928-4601-a795-4e3d1c39984c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
c6dd4f0b-b15a-4864-a793-d9a056777489	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
0b2b34a9-430c-4a45-982f-624dba77409c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
350e788d-39a0-4f15-ab6e-0de4ee753cc7	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
54625c93-8f94-4e85-98df-9d93aac652dd	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
4902a603-e39a-4fdc-9249-3af1735f346e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	a7d87e5e-d029-433f-b38a-837f84489caf
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	email	openid-connect	oidc-usermodel-property-mapper	\N	f61c4983-6312-48c9-88f2-900638f9b194
fddd3ebe-c878-45e0-838c-7c2ed63fa718	email verified	openid-connect	oidc-usermodel-property-mapper	\N	f61c4983-6312-48c9-88f2-900638f9b194
4a0a1864-8c11-48dd-8381-66c03f1b18c3	address	openid-connect	oidc-address-mapper	\N	d4ae4769-54a6-4dbf-86e5-1027a9612e43
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	8dc9e1df-653f-438f-800e-d83278df7ca7
162d8c86-e39f-42a1-8bdf-953fbcf44527	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	8dc9e1df-653f-438f-800e-d83278df7ca7
bae8dbed-62db-40f1-a081-4dfdacc89315	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	59dca199-ddf4-4f54-9216-52f1684fdc97
31d55a7d-776d-450c-94ad-f0383a5c67fe	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	59dca199-ddf4-4f54-9216-52f1684fdc97
96f3c8a5-208c-4073-8833-ab40f31b54bb	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	59dca199-ddf4-4f54-9216-52f1684fdc97
8e0ca6b0-c3d6-4be4-8b6a-eb5d757a7e4b	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	93ef66e9-ee76-4d1f-be25-6b3871960552
15c56693-8580-42f3-ab8e-079e4c1da626	upn	openid-connect	oidc-usermodel-property-mapper	\N	bf41b9a1-2368-410e-85b3-cb17ce5eaa96
f0ca9433-9633-492e-8417-a68c6e6f429b	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	bf41b9a1-2368-410e-85b3-cb17ce5eaa96
43ab243b-aa9d-473a-8453-ad13dd2b8b54	locale	openid-connect	oidc-usermodel-attribute-mapper	fb05a4b4-1dae-4252-8a18-b20b1c44ee53	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	true	userinfo.token.claim
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	locale	user.attribute
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	true	id.token.claim
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	true	access.token.claim
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	locale	claim.name
0b6d9a66-01eb-4abf-8b41-c5c98818bf27	String	jsonType.label
b9c16f61-bb87-4a70-be3e-4ca9502b79a4	false	single
b9c16f61-bb87-4a70-be3e-4ca9502b79a4	Basic	attribute.nameformat
b9c16f61-bb87-4a70-be3e-4ca9502b79a4	Role	attribute.name
08e0b8e5-4039-4ff1-9e96-a2a6ca14f7e9	true	userinfo.token.claim
08e0b8e5-4039-4ff1-9e96-a2a6ca14f7e9	true	id.token.claim
08e0b8e5-4039-4ff1-9e96-a2a6ca14f7e9	true	access.token.claim
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	true	userinfo.token.claim
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	lastName	user.attribute
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	true	id.token.claim
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	true	access.token.claim
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	family_name	claim.name
f2dc4fd1-8d9b-497e-b2df-c04ed8e4ecee	String	jsonType.label
b6062367-6b26-4da1-bd86-e73e33a56f13	true	userinfo.token.claim
b6062367-6b26-4da1-bd86-e73e33a56f13	firstName	user.attribute
b6062367-6b26-4da1-bd86-e73e33a56f13	true	id.token.claim
b6062367-6b26-4da1-bd86-e73e33a56f13	true	access.token.claim
b6062367-6b26-4da1-bd86-e73e33a56f13	given_name	claim.name
b6062367-6b26-4da1-bd86-e73e33a56f13	String	jsonType.label
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	true	userinfo.token.claim
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	middleName	user.attribute
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	true	id.token.claim
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	true	access.token.claim
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	middle_name	claim.name
e497fe77-24a8-47bc-8a9b-a2cd7afc9094	String	jsonType.label
4eab1ca0-7fab-4071-9435-55881628803e	true	userinfo.token.claim
4eab1ca0-7fab-4071-9435-55881628803e	nickname	user.attribute
4eab1ca0-7fab-4071-9435-55881628803e	true	id.token.claim
4eab1ca0-7fab-4071-9435-55881628803e	true	access.token.claim
4eab1ca0-7fab-4071-9435-55881628803e	nickname	claim.name
4eab1ca0-7fab-4071-9435-55881628803e	String	jsonType.label
0c2c1007-450c-433d-8ad4-da670dd16a7e	true	userinfo.token.claim
0c2c1007-450c-433d-8ad4-da670dd16a7e	username	user.attribute
0c2c1007-450c-433d-8ad4-da670dd16a7e	true	id.token.claim
0c2c1007-450c-433d-8ad4-da670dd16a7e	true	access.token.claim
0c2c1007-450c-433d-8ad4-da670dd16a7e	preferred_username	claim.name
0c2c1007-450c-433d-8ad4-da670dd16a7e	String	jsonType.label
90602b3c-4ec0-461d-a5bf-5acfb1608806	true	userinfo.token.claim
90602b3c-4ec0-461d-a5bf-5acfb1608806	profile	user.attribute
90602b3c-4ec0-461d-a5bf-5acfb1608806	true	id.token.claim
90602b3c-4ec0-461d-a5bf-5acfb1608806	true	access.token.claim
90602b3c-4ec0-461d-a5bf-5acfb1608806	profile	claim.name
90602b3c-4ec0-461d-a5bf-5acfb1608806	String	jsonType.label
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	true	userinfo.token.claim
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	picture	user.attribute
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	true	id.token.claim
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	true	access.token.claim
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	picture	claim.name
7c674f3e-0b0e-4ae3-8a7b-3d59c80b3ff1	String	jsonType.label
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	true	userinfo.token.claim
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	website	user.attribute
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	true	id.token.claim
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	true	access.token.claim
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	website	claim.name
1cd3363f-3ba0-4358-9ad5-1cc3ad5c7e2b	String	jsonType.label
9d610dab-5c77-4e01-b18f-daf15ce2111d	true	userinfo.token.claim
9d610dab-5c77-4e01-b18f-daf15ce2111d	gender	user.attribute
9d610dab-5c77-4e01-b18f-daf15ce2111d	true	id.token.claim
9d610dab-5c77-4e01-b18f-daf15ce2111d	true	access.token.claim
9d610dab-5c77-4e01-b18f-daf15ce2111d	gender	claim.name
9d610dab-5c77-4e01-b18f-daf15ce2111d	String	jsonType.label
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	true	userinfo.token.claim
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	birthdate	user.attribute
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	true	id.token.claim
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	true	access.token.claim
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	birthdate	claim.name
78217ceb-4523-42a2-a2a4-6b7f4d46ea33	String	jsonType.label
416a7d4d-3e30-4276-a6e2-a241ad0da172	true	userinfo.token.claim
416a7d4d-3e30-4276-a6e2-a241ad0da172	zoneinfo	user.attribute
416a7d4d-3e30-4276-a6e2-a241ad0da172	true	id.token.claim
416a7d4d-3e30-4276-a6e2-a241ad0da172	true	access.token.claim
416a7d4d-3e30-4276-a6e2-a241ad0da172	zoneinfo	claim.name
416a7d4d-3e30-4276-a6e2-a241ad0da172	String	jsonType.label
857442ae-ffea-4355-97e3-a4e777aba175	true	userinfo.token.claim
857442ae-ffea-4355-97e3-a4e777aba175	locale	user.attribute
857442ae-ffea-4355-97e3-a4e777aba175	true	id.token.claim
857442ae-ffea-4355-97e3-a4e777aba175	true	access.token.claim
857442ae-ffea-4355-97e3-a4e777aba175	locale	claim.name
857442ae-ffea-4355-97e3-a4e777aba175	String	jsonType.label
1e21ecb9-8872-4393-901c-b85554061008	true	userinfo.token.claim
1e21ecb9-8872-4393-901c-b85554061008	updatedAt	user.attribute
1e21ecb9-8872-4393-901c-b85554061008	true	id.token.claim
1e21ecb9-8872-4393-901c-b85554061008	true	access.token.claim
1e21ecb9-8872-4393-901c-b85554061008	updated_at	claim.name
1e21ecb9-8872-4393-901c-b85554061008	String	jsonType.label
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	true	userinfo.token.claim
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	email	user.attribute
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	true	id.token.claim
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	true	access.token.claim
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	email	claim.name
8a993be5-2c75-46e6-b7c8-b55dfe6d4f52	String	jsonType.label
2967dd48-90c5-4a97-93bf-3b711deda243	true	userinfo.token.claim
2967dd48-90c5-4a97-93bf-3b711deda243	emailVerified	user.attribute
2967dd48-90c5-4a97-93bf-3b711deda243	true	id.token.claim
2967dd48-90c5-4a97-93bf-3b711deda243	true	access.token.claim
2967dd48-90c5-4a97-93bf-3b711deda243	email_verified	claim.name
2967dd48-90c5-4a97-93bf-3b711deda243	boolean	jsonType.label
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	formatted	user.attribute.formatted
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	country	user.attribute.country
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	postal_code	user.attribute.postal_code
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	true	userinfo.token.claim
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	street	user.attribute.street
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	true	id.token.claim
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	region	user.attribute.region
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	true	access.token.claim
4cd1e0d7-ec3b-4c95-9285-dd22cb03f0d8	locality	user.attribute.locality
e1312a48-e368-4e75-9c0c-33e8c152a211	true	userinfo.token.claim
e1312a48-e368-4e75-9c0c-33e8c152a211	phoneNumber	user.attribute
e1312a48-e368-4e75-9c0c-33e8c152a211	true	id.token.claim
e1312a48-e368-4e75-9c0c-33e8c152a211	true	access.token.claim
e1312a48-e368-4e75-9c0c-33e8c152a211	phone_number	claim.name
e1312a48-e368-4e75-9c0c-33e8c152a211	String	jsonType.label
8385a612-a2e2-492f-a647-d18705ff2bc9	true	userinfo.token.claim
8385a612-a2e2-492f-a647-d18705ff2bc9	phoneNumberVerified	user.attribute
8385a612-a2e2-492f-a647-d18705ff2bc9	true	id.token.claim
8385a612-a2e2-492f-a647-d18705ff2bc9	true	access.token.claim
8385a612-a2e2-492f-a647-d18705ff2bc9	phone_number_verified	claim.name
8385a612-a2e2-492f-a647-d18705ff2bc9	boolean	jsonType.label
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	true	multivalued
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	foo	user.attribute
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	true	access.token.claim
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	realm_access.roles	claim.name
a26c7f67-4d42-4dc3-b304-2ae27695f8b8	String	jsonType.label
0b64f679-c36f-4028-9a87-5a05b7f45d1e	true	multivalued
0b64f679-c36f-4028-9a87-5a05b7f45d1e	foo	user.attribute
0b64f679-c36f-4028-9a87-5a05b7f45d1e	true	access.token.claim
0b64f679-c36f-4028-9a87-5a05b7f45d1e	resource_access.${client_id}.roles	claim.name
0b64f679-c36f-4028-9a87-5a05b7f45d1e	String	jsonType.label
a2ee30b0-6c53-476b-88e0-73c240779562	true	userinfo.token.claim
a2ee30b0-6c53-476b-88e0-73c240779562	username	user.attribute
a2ee30b0-6c53-476b-88e0-73c240779562	true	id.token.claim
a2ee30b0-6c53-476b-88e0-73c240779562	true	access.token.claim
a2ee30b0-6c53-476b-88e0-73c240779562	upn	claim.name
a2ee30b0-6c53-476b-88e0-73c240779562	String	jsonType.label
267fe3b2-3c59-4007-a356-e5acd3cbd402	true	multivalued
267fe3b2-3c59-4007-a356-e5acd3cbd402	foo	user.attribute
267fe3b2-3c59-4007-a356-e5acd3cbd402	true	id.token.claim
267fe3b2-3c59-4007-a356-e5acd3cbd402	true	access.token.claim
267fe3b2-3c59-4007-a356-e5acd3cbd402	groups	claim.name
267fe3b2-3c59-4007-a356-e5acd3cbd402	String	jsonType.label
65e62c01-e315-4bcc-891c-75a079ef7714	false	single
65e62c01-e315-4bcc-891c-75a079ef7714	Basic	attribute.nameformat
65e62c01-e315-4bcc-891c-75a079ef7714	Role	attribute.name
242b789e-c4f8-4ec4-aca6-5201bc595a4d	true	userinfo.token.claim
242b789e-c4f8-4ec4-aca6-5201bc595a4d	true	id.token.claim
242b789e-c4f8-4ec4-aca6-5201bc595a4d	true	access.token.claim
6901dc3a-0f9a-4de3-b583-8cc9652ec185	true	userinfo.token.claim
6901dc3a-0f9a-4de3-b583-8cc9652ec185	lastName	user.attribute
6901dc3a-0f9a-4de3-b583-8cc9652ec185	true	id.token.claim
6901dc3a-0f9a-4de3-b583-8cc9652ec185	true	access.token.claim
6901dc3a-0f9a-4de3-b583-8cc9652ec185	family_name	claim.name
6901dc3a-0f9a-4de3-b583-8cc9652ec185	String	jsonType.label
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	true	userinfo.token.claim
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	firstName	user.attribute
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	true	id.token.claim
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	true	access.token.claim
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	given_name	claim.name
d9c597fb-50cd-4683-9f1d-74b57c8dcc2b	String	jsonType.label
f09b150e-8b93-4b27-aa45-ca412ec53954	true	userinfo.token.claim
f09b150e-8b93-4b27-aa45-ca412ec53954	middleName	user.attribute
f09b150e-8b93-4b27-aa45-ca412ec53954	true	id.token.claim
f09b150e-8b93-4b27-aa45-ca412ec53954	true	access.token.claim
f09b150e-8b93-4b27-aa45-ca412ec53954	middle_name	claim.name
f09b150e-8b93-4b27-aa45-ca412ec53954	String	jsonType.label
a2862497-61de-4d35-bf50-2a7433ee8ba4	true	userinfo.token.claim
a2862497-61de-4d35-bf50-2a7433ee8ba4	nickname	user.attribute
a2862497-61de-4d35-bf50-2a7433ee8ba4	true	id.token.claim
a2862497-61de-4d35-bf50-2a7433ee8ba4	true	access.token.claim
a2862497-61de-4d35-bf50-2a7433ee8ba4	nickname	claim.name
a2862497-61de-4d35-bf50-2a7433ee8ba4	String	jsonType.label
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	true	userinfo.token.claim
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	username	user.attribute
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	true	id.token.claim
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	true	access.token.claim
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	preferred_username	claim.name
46f8a2b0-88c2-4008-8fb8-58dd3d37d569	String	jsonType.label
f0f69b40-3756-4268-b3dc-e24ef11143aa	true	userinfo.token.claim
f0f69b40-3756-4268-b3dc-e24ef11143aa	profile	user.attribute
f0f69b40-3756-4268-b3dc-e24ef11143aa	true	id.token.claim
f0f69b40-3756-4268-b3dc-e24ef11143aa	true	access.token.claim
f0f69b40-3756-4268-b3dc-e24ef11143aa	profile	claim.name
f0f69b40-3756-4268-b3dc-e24ef11143aa	String	jsonType.label
cd4c10d9-04cc-41be-a4ad-53e417f15337	true	userinfo.token.claim
cd4c10d9-04cc-41be-a4ad-53e417f15337	picture	user.attribute
cd4c10d9-04cc-41be-a4ad-53e417f15337	true	id.token.claim
cd4c10d9-04cc-41be-a4ad-53e417f15337	true	access.token.claim
cd4c10d9-04cc-41be-a4ad-53e417f15337	picture	claim.name
cd4c10d9-04cc-41be-a4ad-53e417f15337	String	jsonType.label
fdc20345-d928-4601-a795-4e3d1c39984c	true	userinfo.token.claim
fdc20345-d928-4601-a795-4e3d1c39984c	website	user.attribute
fdc20345-d928-4601-a795-4e3d1c39984c	true	id.token.claim
fdc20345-d928-4601-a795-4e3d1c39984c	true	access.token.claim
fdc20345-d928-4601-a795-4e3d1c39984c	website	claim.name
fdc20345-d928-4601-a795-4e3d1c39984c	String	jsonType.label
c6dd4f0b-b15a-4864-a793-d9a056777489	true	userinfo.token.claim
c6dd4f0b-b15a-4864-a793-d9a056777489	gender	user.attribute
c6dd4f0b-b15a-4864-a793-d9a056777489	true	id.token.claim
c6dd4f0b-b15a-4864-a793-d9a056777489	true	access.token.claim
c6dd4f0b-b15a-4864-a793-d9a056777489	gender	claim.name
c6dd4f0b-b15a-4864-a793-d9a056777489	String	jsonType.label
0b2b34a9-430c-4a45-982f-624dba77409c	true	userinfo.token.claim
0b2b34a9-430c-4a45-982f-624dba77409c	birthdate	user.attribute
0b2b34a9-430c-4a45-982f-624dba77409c	true	id.token.claim
0b2b34a9-430c-4a45-982f-624dba77409c	true	access.token.claim
0b2b34a9-430c-4a45-982f-624dba77409c	birthdate	claim.name
0b2b34a9-430c-4a45-982f-624dba77409c	String	jsonType.label
350e788d-39a0-4f15-ab6e-0de4ee753cc7	true	userinfo.token.claim
350e788d-39a0-4f15-ab6e-0de4ee753cc7	zoneinfo	user.attribute
350e788d-39a0-4f15-ab6e-0de4ee753cc7	true	id.token.claim
350e788d-39a0-4f15-ab6e-0de4ee753cc7	true	access.token.claim
350e788d-39a0-4f15-ab6e-0de4ee753cc7	zoneinfo	claim.name
350e788d-39a0-4f15-ab6e-0de4ee753cc7	String	jsonType.label
54625c93-8f94-4e85-98df-9d93aac652dd	true	userinfo.token.claim
54625c93-8f94-4e85-98df-9d93aac652dd	locale	user.attribute
54625c93-8f94-4e85-98df-9d93aac652dd	true	id.token.claim
54625c93-8f94-4e85-98df-9d93aac652dd	true	access.token.claim
54625c93-8f94-4e85-98df-9d93aac652dd	locale	claim.name
54625c93-8f94-4e85-98df-9d93aac652dd	String	jsonType.label
4902a603-e39a-4fdc-9249-3af1735f346e	true	userinfo.token.claim
4902a603-e39a-4fdc-9249-3af1735f346e	updatedAt	user.attribute
4902a603-e39a-4fdc-9249-3af1735f346e	true	id.token.claim
4902a603-e39a-4fdc-9249-3af1735f346e	true	access.token.claim
4902a603-e39a-4fdc-9249-3af1735f346e	updated_at	claim.name
4902a603-e39a-4fdc-9249-3af1735f346e	String	jsonType.label
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	true	userinfo.token.claim
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	email	user.attribute
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	true	id.token.claim
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	true	access.token.claim
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	email	claim.name
a3f62df4-a938-4235-b54e-d7eb9bb9fc35	String	jsonType.label
fddd3ebe-c878-45e0-838c-7c2ed63fa718	true	userinfo.token.claim
fddd3ebe-c878-45e0-838c-7c2ed63fa718	emailVerified	user.attribute
fddd3ebe-c878-45e0-838c-7c2ed63fa718	true	id.token.claim
fddd3ebe-c878-45e0-838c-7c2ed63fa718	true	access.token.claim
fddd3ebe-c878-45e0-838c-7c2ed63fa718	email_verified	claim.name
fddd3ebe-c878-45e0-838c-7c2ed63fa718	boolean	jsonType.label
4a0a1864-8c11-48dd-8381-66c03f1b18c3	formatted	user.attribute.formatted
4a0a1864-8c11-48dd-8381-66c03f1b18c3	country	user.attribute.country
4a0a1864-8c11-48dd-8381-66c03f1b18c3	postal_code	user.attribute.postal_code
4a0a1864-8c11-48dd-8381-66c03f1b18c3	true	userinfo.token.claim
4a0a1864-8c11-48dd-8381-66c03f1b18c3	street	user.attribute.street
4a0a1864-8c11-48dd-8381-66c03f1b18c3	true	id.token.claim
4a0a1864-8c11-48dd-8381-66c03f1b18c3	region	user.attribute.region
4a0a1864-8c11-48dd-8381-66c03f1b18c3	true	access.token.claim
4a0a1864-8c11-48dd-8381-66c03f1b18c3	locality	user.attribute.locality
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	true	userinfo.token.claim
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	phoneNumber	user.attribute
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	true	id.token.claim
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	true	access.token.claim
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	phone_number	claim.name
ef35261b-2e35-4cf1-8f07-6e5d3b431b94	String	jsonType.label
162d8c86-e39f-42a1-8bdf-953fbcf44527	true	userinfo.token.claim
162d8c86-e39f-42a1-8bdf-953fbcf44527	phoneNumberVerified	user.attribute
162d8c86-e39f-42a1-8bdf-953fbcf44527	true	id.token.claim
162d8c86-e39f-42a1-8bdf-953fbcf44527	true	access.token.claim
162d8c86-e39f-42a1-8bdf-953fbcf44527	phone_number_verified	claim.name
162d8c86-e39f-42a1-8bdf-953fbcf44527	boolean	jsonType.label
bae8dbed-62db-40f1-a081-4dfdacc89315	true	multivalued
bae8dbed-62db-40f1-a081-4dfdacc89315	foo	user.attribute
bae8dbed-62db-40f1-a081-4dfdacc89315	true	access.token.claim
bae8dbed-62db-40f1-a081-4dfdacc89315	realm_access.roles	claim.name
bae8dbed-62db-40f1-a081-4dfdacc89315	String	jsonType.label
31d55a7d-776d-450c-94ad-f0383a5c67fe	true	multivalued
31d55a7d-776d-450c-94ad-f0383a5c67fe	foo	user.attribute
31d55a7d-776d-450c-94ad-f0383a5c67fe	true	access.token.claim
31d55a7d-776d-450c-94ad-f0383a5c67fe	resource_access.${client_id}.roles	claim.name
31d55a7d-776d-450c-94ad-f0383a5c67fe	String	jsonType.label
15c56693-8580-42f3-ab8e-079e4c1da626	true	userinfo.token.claim
15c56693-8580-42f3-ab8e-079e4c1da626	username	user.attribute
15c56693-8580-42f3-ab8e-079e4c1da626	true	id.token.claim
15c56693-8580-42f3-ab8e-079e4c1da626	true	access.token.claim
15c56693-8580-42f3-ab8e-079e4c1da626	upn	claim.name
15c56693-8580-42f3-ab8e-079e4c1da626	String	jsonType.label
f0ca9433-9633-492e-8417-a68c6e6f429b	true	multivalued
f0ca9433-9633-492e-8417-a68c6e6f429b	foo	user.attribute
f0ca9433-9633-492e-8417-a68c6e6f429b	true	id.token.claim
f0ca9433-9633-492e-8417-a68c6e6f429b	true	access.token.claim
f0ca9433-9633-492e-8417-a68c6e6f429b	groups	claim.name
f0ca9433-9633-492e-8417-a68c6e6f429b	String	jsonType.label
43ab243b-aa9d-473a-8453-ad13dd2b8b54	true	userinfo.token.claim
43ab243b-aa9d-473a-8453-ad13dd2b8b54	locale	user.attribute
43ab243b-aa9d-473a-8453-ad13dd2b8b54	true	id.token.claim
43ab243b-aa9d-473a-8453-ad13dd2b8b54	true	access.token.claim
43ab243b-aa9d-473a-8453-ad13dd2b8b54	locale	claim.name
43ab243b-aa9d-473a-8453-ad13dd2b8b54	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me) FROM stdin;
master	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	921e2f83-96b2-4f85-8f09-bf63e686a387	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	7123b757-fc16-430b-8b23-b277f0a4f9b9	917e5f5b-1ee4-4013-be78-451c08f2da5c	626e8bee-8475-4fa4-95c3-cfe848412299	572998cf-a96e-40bf-a72f-68c277e55c97	ad4320fa-c095-4ed8-96b8-14c97d2d869c	2592000	f	900	t	f	7ae16dc3-3e51-4b56-bb26-001fd457ae6f	0	f	0	0
Demo	60	300	300	\N	\N	\N	t	f	0	\N	demo	0	\N	t	t	t	f	EXTERNAL	1800	36000	f	f	f5f980fe-2c9f-4f3a-ae05-65613a112afd	1800	f	\N	t	f	f	f	0	1	30	6	HmacSHA1	totp	056f65d2-3de1-4409-9560-e161833566f5	8996d454-4504-4857-baaa-55a35bf5d69d	06f8c9b4-5fda-4143-aec2-24c1671007c9	3ff8ddfb-fe77-4313-96fb-802609289c87	7b320d21-2bde-40d4-b7fa-0787ac759655	2592000	f	900	t	f	f81334ea-d98a-4f45-82ae-567d0da71e7c	0	f	0	0
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, value, realm_id) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly		master
_browser_header.xContentTypeOptions	nosniff	master
_browser_header.xRobotsTag	none	master
_browser_header.xFrameOptions	SAMEORIGIN	master
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	master
_browser_header.xXSSProtection	1; mode=block	master
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	master
bruteForceProtected	false	master
permanentLockout	false	master
maxFailureWaitSeconds	900	master
minimumQuickLoginWaitSeconds	60	master
waitIncrementSeconds	60	master
quickLoginCheckMilliSeconds	1000	master
maxDeltaTimeSeconds	43200	master
failureFactor	30	master
displayName	Keycloak	master
displayNameHtml	<div class="kc-logo-text"><span>Keycloak</span></div>	master
offlineSessionMaxLifespanEnabled	false	master
offlineSessionMaxLifespan	5184000	master
_browser_header.contentSecurityPolicyReportOnly		Demo
_browser_header.xContentTypeOptions	nosniff	Demo
_browser_header.xRobotsTag	none	Demo
_browser_header.xFrameOptions	SAMEORIGIN	Demo
_browser_header.contentSecurityPolicy	frame-src 'self'; frame-ancestors 'self'; object-src 'none';	Demo
_browser_header.xXSSProtection	1; mode=block	Demo
_browser_header.strictTransportSecurity	max-age=31536000; includeSubDomains	Demo
bruteForceProtected	false	Demo
permanentLockout	false	Demo
maxFailureWaitSeconds	900	Demo
minimumQuickLoginWaitSeconds	60	Demo
waitIncrementSeconds	60	Demo
quickLoginCheckMilliSeconds	1000	Demo
maxDeltaTimeSeconds	43200	Demo
failureFactor	30	Demo
offlineSessionMaxLifespanEnabled	false	Demo
offlineSessionMaxLifespan	5184000	Demo
actionTokenGeneratedByAdminLifespan	43200	Demo
actionTokenGeneratedByUserLifespan	300	Demo
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_default_roles; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_roles (realm_id, role_id) FROM stdin;
master	937853b7-42b3-46d9-a490-a4eb425153be
master	6d558a6f-6807-4ef7-bd8b-ed8cff9afd89
Demo	74dce7d6-1086-425c-ab42-c950e375ff5a
Demo	65627dea-b983-403f-a0af-c3637bbaf083
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
master	jboss-logging
Demo	jboss-logging
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	master
password	password	t	t	Demo
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
34304f4f-a3f7-4302-9e71-eecd04c640d0	/auth/realms/master/account/*
47c573b1-4c7b-4e30-8154-866c8055a8eb	/auth/admin/master/console/*
c0ddcd89-023d-4b83-bb1b-02869e61f470	urn:ietf:wg:oauth:2.0:oob
fb05a4b4-1dae-4252-8a18-b20b1c44ee53	/auth/admin/demo/console/*
574e2caf-cccd-4ca1-9e3a-08ab978dbad5	/auth/realms/demo/account/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
aaa2eaac-b7d3-43b3-91f5-06f8ef3d4fe8	VERIFY_EMAIL	Verify Email	master	t	f	VERIFY_EMAIL	50
f163739b-af03-476e-8a86-cf21a82e29a8	UPDATE_PROFILE	Update Profile	master	t	f	UPDATE_PROFILE	40
5087ff67-ef2b-4d43-b082-9f796ec23180	CONFIGURE_TOTP	Configure OTP	master	t	f	CONFIGURE_TOTP	10
e8518b8f-4e63-41b3-aaf3-303b789d574c	UPDATE_PASSWORD	Update Password	master	t	f	UPDATE_PASSWORD	30
73f92dff-8244-47ec-bc92-956b1fcce870	terms_and_conditions	Terms and Conditions	master	f	f	terms_and_conditions	20
e29d89db-3d84-4469-a45d-38c4257fe1c7	VERIFY_EMAIL	Verify Email	Demo	t	f	VERIFY_EMAIL	50
be145b81-1f0f-45e6-a39a-bdc0340d7ac8	UPDATE_PROFILE	Update Profile	Demo	t	f	UPDATE_PROFILE	40
9999fcb2-77b3-47c3-b2b7-1413380dcf36	CONFIGURE_TOTP	Configure OTP	Demo	t	f	CONFIGURE_TOTP	10
60a8a65c-625a-4895-9354-e3a1b19afc50	UPDATE_PASSWORD	Update Password	Demo	t	f	UPDATE_PASSWORD	30
4853fa2f-8f86-4250-a51c-9b0eeb30ce17	terms_and_conditions	Terms and Conditions	Demo	f	f	terms_and_conditions	20
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
5de7b491-8494-40d4-bf0b-4b682bab5acb	\N	7b84ceda-063f-46e0-8e6d-555e261d5557	f	t	\N	\N	\N	master	keycloak	1574293980830	\N	0
92582c83-e6a2-4ab8-82fc-323261175339	cwalker@sparkcognition.com	cwalker@sparkcognition.com	f	t	\N	Charlie	Walker	Demo	cwalker@sparkcognition.com	1582933056534	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
937853b7-42b3-46d9-a490-a4eb425153be	5de7b491-8494-40d4-bf0b-4b682bab5acb
2fe57b70-4fee-4280-bbed-2ba16847bd6e	5de7b491-8494-40d4-bf0b-4b682bab5acb
c7246f7f-b1c2-483f-af90-f4313ce17662	5de7b491-8494-40d4-bf0b-4b682bab5acb
6d558a6f-6807-4ef7-bd8b-ed8cff9afd89	5de7b491-8494-40d4-bf0b-4b682bab5acb
4f325da9-c84a-4ec2-9b35-a4a4ec6ec07a	5de7b491-8494-40d4-bf0b-4b682bab5acb
3cf6e888-ae63-4b8e-b7ee-bdabe7d5ec0e	92582c83-e6a2-4ab8-82fc-323261175339
74dce7d6-1086-425c-ab42-c950e375ff5a	92582c83-e6a2-4ab8-82fc-323261175339
d3def975-64e1-4a24-b969-9dcb7221acb4	92582c83-e6a2-4ab8-82fc-323261175339
65627dea-b983-403f-a0af-c3637bbaf083	92582c83-e6a2-4ab8-82fc-323261175339
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: client_default_roles constr_client_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT constr_client_default_roles PRIMARY KEY (client_id, role_id);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: credential_attribute constraint_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT constraint_credential_attr PRIMARY KEY (id);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: fed_credential_attribute constraint_fed_credential_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT constraint_fed_credential_attr PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: realm_default_roles constraint_realm_default_roles; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT constraint_realm_default_roles PRIMARY KEY (realm_id, role_id);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client_default_roles uk_8aelwnibji49avxsrtuf6xjow; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT uk_8aelwnibji49avxsrtuf6xjow UNIQUE (role_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: realm_default_roles uk_h4wpd7w4hsoolni3h0sw7btje; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT uk_h4wpd7w4hsoolni3h0sw7btje UNIQUE (role_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_def_roles_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_def_roles_client ON public.client_default_roles USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_credential_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_credential_attr_cred ON public.credential_attribute USING btree (credential_id);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_fed_cred_attr_cred; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fed_cred_attr_cred ON public.fed_credential_attribute USING btree (credential_id);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_def_roles_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_roles_realm ON public.realm_default_roles USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_default_roles fk_8aelwnibji49avxsrtuf6xjow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_8aelwnibji49avxsrtuf6xjow FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_client fk_c_cli_scope_client; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_client FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_scope_client fk_c_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT fk_c_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: credential_attribute fk_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential_attribute
    ADD CONSTRAINT fk_cred_attr FOREIGN KEY (credential_id) REFERENCES public.credential(id);


--
-- Name: realm_default_groups fk_def_groups_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_roles fk_evudb1ppw84oxfax2drs03icc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_evudb1ppw84oxfax2drs03icc FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: fed_credential_attribute fk_fed_cred_attr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_credential_attribute
    ADD CONSTRAINT fk_fed_cred_attr FOREIGN KEY (credential_id) REFERENCES public.fed_user_credential(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: keycloak_group fk_group_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT fk_group_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_role; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_role FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_default_roles fk_h4wpd7w4hsoolni3h0sw7btje; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_roles
    ADD CONSTRAINT fk_h4wpd7w4hsoolni3h0sw7btje FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: keycloak_role fk_kjho5le2c0ral09fl8cm9wfw9; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_kjho5le2c0ral09fl8cm9wfw9 FOREIGN KEY (client) REFERENCES public.client(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_default_roles fk_nuilts7klwqw2h8m2b5joytky; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_default_roles
    ADD CONSTRAINT fk_nuilts7klwqw2h8m2b5joytky FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_p3rh9grku11kqfrs4fltt7rnq; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_p3rh9grku11kqfrs4fltt7rnq FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: client fk_p56ctinxxb9gsk57fo49f9tac; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT fk_p56ctinxxb9gsk57fo49f9tac FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope fk_realm_cli_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT fk_realm_cli_scope FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: realm fk_traf444kk6qrkms7n56aiwq5y; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT fk_traf444kk6qrkms7n56aiwq5y FOREIGN KEY (master_admin_client) REFERENCES public.client(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

