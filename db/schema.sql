CREATE TABLE users(id serial PRIMARY KEY,email text UNIQUE NOT NULL,password text NOT NULL,role text NOT NULL DEFAULT 'viewer',expires timestamptz);
CREATE TABLE content(id serial PRIMARY KEY,title text NOT NULL,category text NOT NULL,premium boolean NOT NULL DEFAULT true,published boolean NOT NULL DEFAULT false);
CREATE TABLE sessions(id uuid PRIMARY KEY,user_id int REFERENCES users,content_id int REFERENCES content,expires timestamptz NOT NULL);
CREATE TABLE progress(user_id int REFERENCES users,content_id int REFERENCES content,seconds int CHECK(seconds>=0),PRIMARY KEY(user_id,content_id));
CREATE TABLE playlist(user_id int REFERENCES users,content_id int REFERENCES content,PRIMARY KEY(user_id,content_id));
INSERT INTO content(title,category,premium,published) VALUES ('Color Lab','Demo',false,true),('Studio Preview','Demo',true,true);
