function connect_socrat_db_stage --wraps='mycli -u mysqluser_testing -h stage.usertrb.net usertribe_prod -p (skate get socrat_db_stage_pass)' --description 'alias connect_socrat_db_stage mycli -u mysqluser_testing -h stage.usertrb.net usertribe_prod -p (skate get socrat_db_stage_pass)'
  mycli -u mysqluser_testing -h stage.usertrb.net usertribe_prod -p (skate get socrat_db_stage_pass) $argv
        
end
