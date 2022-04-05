
CREATE DATABASE IF NOT EXISTS bridge_recon_fix;

use bridge_recon_fix;

DROP TABLE IF EXISTS connected_users;
CREATE TABLE connected_users(
    user_id INT UNSIGNED PRIMARY KEY
);

DROP TABLE IF EXISTS current_works;
CREATE TABLE current_works(
    work_id INT UNSIGNED PRIMARY KEY,
    work_progress FLOAT NOT NULL,
    current_work_type INT NOT NULL,
    message VARCHAR(1024)
);


DROP TABLE IF EXISTS server_process_items;
CREATE TABLE server_process_items(
    item_id INT UNSIGNED AUTO_INCREMENT,
    work_id INT UNSIGNED,
    item_data VARCHAR(2048) NOT NULL,
    process_type INT NOT NULL,
    PRIMARY KEY(item_id, work_id),
    FOREIGN KEY(work_id) REFERENCES current_works(work_id)
);

--0 �Ź������������µĹ���
INSERT INTO current_works (work_id, work_progress, current_work_type) VALUES (0, 0, 0);

DROP TABLE IF EXISTS client_process_items;
CREATE TABLE client_process_items(
    item_id INT UNSIGNED AUTO_INCREMENT,
    work_id INT UNSIGNED,
    item_data VARCHAR(2048) NOT NULL,
    process_type INT NOT NULL,
    PRIMARY KEY(item_id, work_id),
    FOREIGN KEY(work_id) REFERENCES current_works(work_id)
);

-- �����������û�
CREATE USER 'recon3d_server'@'%' IDENTIFIED BY 'recon3d';
GRANT ALL ON bridge_recon_fix.* TO 'recon3d_server'@'%' WITH GRANT OPTION;
-- �����ͻ����û�
CREATE USER 'recon3d_client'@'%' IDENTIFIED BY '666666';
GRANT SELECT,INSERT ON bridge_recon_fix.server_process_items TO 'recon3d_client'@'%';
GRANT SELECT ON bridge_recon_fix.client_process_items TO 'recon3d_client'@'%';
GRANT SELECT ON bridge_recon_fix.current_works TO 'recon3d_client'@'%';
GRANT SELECT ON bridge_recon_fix.connected_users TO 'recon3d_client'@'%';


