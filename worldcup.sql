CREATE TABLE IF NOT EXISTS teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS games(
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_id INT REFERENCES teams(team_id) NOT NULL,
  opponent_id INT REFERENCES teams(team_id) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);
