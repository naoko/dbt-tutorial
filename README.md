# dbt-tutorial

~/.dbt/profile.yaml
```
jaffle_shop:
  outputs:
    dev:
      type: postgres
      threads: 1
      host: localhost
      port: 5433
      user: me
      pass: seecret
      dbname: test_db
      schema: dev-schema

    prod:
      type: postgres
      threads: [1 or more]
      host: [host]
      port: [port]
      user: [prod_username]
      pass: [prod_password]
      dbname: [dbname]
      schema: [prod_schema]

  target: dev

```

```
docker-compose up -d
```

```
✗ cd jaffle_shop

✗ dbt debug
21:33:13  Running with dbt=1.0.1
dbt version: 1.0.1
python version: 3.8.8
python path: /home/naoko/.pyenv/versions/3.8.8/envs/dbt/bin/python3.8
os info: Linux-5.13.0-41-generic-x86_64-with-glibc2.33
Using profiles.yml file at /home/naoko/.dbt/profiles.yml
Using dbt_project.yml file at /home/naoko/projects/dbt-tutorial/jaffle_shop/dbt_project.yml

Configuration:
  profiles.yml file [OK found and valid]
  dbt_project.yml file [OK found and valid]

Required dependencies:
 - git [OK found]

Connection:
  host: localhost
  port: 5433
  user: me
  database: test_db
  schema: dev-schema
  search_path: None
  keepalives_idle: 0
  sslmode: None
  Connection test: [OK connection ok]

All checks passed!
```


build model
```
✗ dbt run
21:35:52  Running with dbt=1.0.1
21:35:52  Partial parse save file not found. Starting full parse.
21:35:52  Found 2 models, 4 tests, 0 snapshots, 0 analyses, 165 macros, 0 operations, 0 seed files, 0 sources, 0 exposures, 0 metrics
21:35:52  
21:35:53  Concurrency: 1 threads (target='dev')
21:35:53  
21:35:53  1 of 2 START table model dev-schema.my_first_dbt_model.......................... [RUN]
21:35:53  1 of 2 OK created table model dev-schema.my_first_dbt_model..................... [SELECT 2 in 0.05s]
21:35:53  2 of 2 START view model dev-schema.my_second_dbt_model.......................... [RUN]
21:35:53  2 of 2 OK created view model dev-schema.my_second_dbt_model..................... [CREATE VIEW in 0.03s]
21:35:53  
21:35:53  Finished running 1 table model, 1 view model in 0.14s.
21:35:53  
21:35:53  Completed successfully
21:35:53  
21:35:53  Done. PASS=2 WARN=0 ERROR=0 SKIP=0 TOTAL=2
```