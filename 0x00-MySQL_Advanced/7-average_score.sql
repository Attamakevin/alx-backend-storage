-- Write a SQL script that creates a stored procedure ComputeAverageScoreForUse
-- r that computes and store the average score for a student. Note: An average score can be a decimal
DELIMITER $$;

CREATE PROCEDURE ComputeAverageScoreForUser(IN user_id INT)
BEGIN
    DECLARE avg_score DECIMAL(10, 2);

    -- Calculate the average score for the user
    SELECT AVG(score) INTO avg_score
    FROM scores
    WHERE user_id = user_id;

    -- Insert or update the average score in a user_avg_scores table
    -- If the user already has an entry, update it; otherwise, insert a new record.
    INSERT INTO user_avg_scores (user_id, average_score)
    VALUES (user_id, avg_score)
    ON DUPLICATE KEY UPDATE average_score = avg_score;

END; $$

DELIMITER ;

