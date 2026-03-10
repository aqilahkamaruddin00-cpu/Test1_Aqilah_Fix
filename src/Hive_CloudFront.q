CREATE EXTERNAL TABLE IF NOT EXISTS cloudfront_logs (
  `DateObject` DATE,
  `Time` STRING,
  Location STRING,
  Bytes INT,
  RequestIP STRING,
  Method STRING,
  Host STRING,
  Uri STRING,
  Status INT,
  Referrer STRING,
  `OS` STRING,
  Browser STRING,
  BrowserVersion STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "^(?!#)([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+[^\(]+[\(](https://s3.us-west-2.amazonaws.com/us-west-2-aws-training/awsu-spl/spl-166/1.0.10.prod/instructions/en_us/[^\;]+).*\%20([^\/]+)[\/](https://s3.us-west-2.amazonaws.com/us-west-2-aws-training/awsu-spl/spl-166/1.0.10.prod/instructions/en_us/.*)$"
)
LOCATION '${INPUT}/cloudfront/data/';