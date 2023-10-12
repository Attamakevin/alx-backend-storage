-- Write a SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers
-- that computes and store the average weighted score for all students.
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE weighted_avg DECIMAL(10, 2);

    -- Calculate the weighted average score for the user
    SELECT SUM(score * weight) / SUM(weight) INTO weighted_avg
    FROM scores
    WHERE user_id = user_id;

    -- Insert or update the weighted average score in a user_weighted_avg_scores table
    -- If the user already has an entry, update it; otherwise, insert a new record.
    INSERT INTO user_weighted_avg_scores (user_id, weighted_average_score)
    VALUES (user_id, weighted_avg)
    ON DUPLICATE KEY UPDATE weighted_average_score = weighted_avg;

END //

DELIMITER ;

