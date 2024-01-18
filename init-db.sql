-- Tabelas de Usuários e Papéis:
CREATE TABLE roles
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    UNIQUE (name)
);

CREATE TABLE users
(
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role_id  INT,
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

-- Tabela de Permissões e Associação com Papéis:
CREATE TABLE permissions
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    UNIQUE (name)
);

CREATE TABLE role_permissions
(
    role_id       INT,
    permission_id INT,
    PRIMARY KEY (role_id, permission_id),
    FOREIGN KEY (role_id) REFERENCES roles (id),
    FOREIGN KEY (permission_id) REFERENCES permissions (id)
);

-- Tabela de Posts do Blog:
CREATE TABLE posts
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    user_id    INT,
    title      VARCHAR(255) NOT NULL,
    content    TEXT         NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

INSERT INTO roles (name) VALUES ('visitante'), ('administrador');

INSERT INTO permissions (name) VALUES ('create_post'), ('read_post'), ('update_post'), ('delete_post'), ('access_admin');

-- Associe as permissões aos papéis conforme necessário
-- Exemplo: Dê ao administrador todas as permissões
INSERT INTO role_permissions (role_id, permission_id) SELECT roles.id, permissions.id FROM roles, permissions WHERE roles.name = 'administrador';

INSERT INTO posts (user_id, title, content) VALUES
                                                ((SELECT id FROM users WHERE username = 'userAdmin'), 'Título do Post 1', 'Conteúdo do Post 1'),
                                                ((SELECT id FROM users WHERE username = 'userEditor'), 'Título do Post 2', 'Conteúdo do Post 2');
