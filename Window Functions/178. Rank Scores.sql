select score, dense_rank() over (order by score desc) as rank
from scores

-- RANK(): 동점 다음 순위를 건너뛴다 (2등이 2명이면 다음은 4등)
-- DENSE_RANK(): 동점 다음 순위를 건너뛰지 않는다 (2등이 2명이어도 다음은 3등)
-- ROW_NUMBER(): 동점 상관없이 그냥 행 순서대로 번호 매김 (동점이어도 다른 번호)
