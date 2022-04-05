
use bridge_recon_fix;

INSERT INTO connected_users (user_id) VALUES (1);
DELETE FROM connected_users WHERE user_id=1;

INSERT INTO current_works (work_id, work_progress, current_work_type) VALUES (114514, 0, 0);
SELECT COUNT(*) FROM current_works;
SELECT * FROM current_works;
UPDATE current_works SET work_progress=0.5, current_work_type=1 WHERE work_id=114514;
DELETE FROM current_works WHERE work_id=114514;

INSERT INTO server_process_items (work_id, item_data, process_type) VALUES (1919810, '/xkein/home/recon/server/tmp', 0);
DELETE FROM server_process_items WHERE work_id=114514;
SELECT * FROM server_process_items;

-- send work request
INSERT INTO server_process_items (work_id, item_data, process_type) VALUES (0, 'request token!', 1);
-- send work finish
INSERT INTO server_process_items (work_id, item_data, process_type) VALUES (958169357, 'request token!', 2);

-- clean users
DELETE FROM connected_users;
-- clean works
DELETE FROM client_process_items;
DELETE FROM server_process_items;
DELETE FROM current_works WHERE work_id!=0;

