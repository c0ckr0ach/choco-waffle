CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO tasks (title) VALUES 
('Setup Linux & WSL environment'),
('Implement multi-stage Docker builds'),
('Provision AWS infrastructure via Terraform')
ON CONFLICT DO NOTHING;