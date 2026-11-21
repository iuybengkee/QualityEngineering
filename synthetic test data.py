# Databricks notebook source
# MAGIC %pip install faker
# MAGIC from faker import Faker
# MAGIC import pandas as pd
# MAGIC
# MAGIC fake = Faker("en_CA")
# MAGIC Faker.seed(42)  # same data every run, so tests are repeatable
# MAGIC
# MAGIC rows = [{
# MAGIC     "customer_id": i,
# MAGIC     "name": fake.name(),
# MAGIC     "email": fake.email(),
# MAGIC     "phone": fake.phone_number(),
# MAGIC     "address": fake.address().replace("\n", ", "),
# MAGIC     "birth_date": fake.date_of_birth(minimum_age=18, maximum_age=90),
# MAGIC     "balance": round(fake.pyfloat(min_value=-500, max_value=20000), 2),  # includes negative and boundary-style values
# MAGIC } for i in range(1, 1001)]
# MAGIC
# MAGIC df = spark.createDataFrame(pd.DataFrame(rows))
# MAGIC df.write.mode("overwrite").saveAsTable("test_customers_synthetic")

# COMMAND ----------

# MAGIC %sql
# MAGIC Select * from test_customers_synthetic
# MAGIC

# COMMAND ----------

Faker.seed(7)

def addr():
    return fake.address().replace("\n", ", ")

def good(i):
    return (i, fake.name(), fake.email(), fake.phone_number(), addr(),
            str(fake.date_of_birth(minimum_age=18, maximum_age=90)),
            round(fake.pyfloat(min_value=0, max_value=20000), 2))

rows = [good(i) for i in range(1, 11)]  # 10 normal rows

rows += [
    (11, fake.name(), None,         fake.phone_number(), addr(), "1990-05-12", 150.0),        # null email
    (3,  fake.name(), fake.email(), fake.phone_number(), addr(), "1985-03-20", 900.0),        # duplicate customer_id
    (12, fake.name(), fake.email(), fake.phone_number(), addr(), "2025-13-45", 300.0),        # invalid date
    (13, fake.name(), fake.email(), fake.phone_number(), addr(), "2090-01-01", 300.0),        # future birth date
    (14, "",          fake.email(), "abc-not-a-phone",   addr(), "1975-07-01", -999999.99),   # empty name, bad phone, extreme balance
]

schema = "customer_id INT, name STRING, email STRING, phone STRING, address STRING, birth_date STRING, balance DOUBLE"
df_bad = spark.createDataFrame(rows, schema)
df_bad.write.mode("overwrite").saveAsTable("test_customers_negative")

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM test_customers_negative

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM test_customers_negative WHERE email IS NULL

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT customer_id, COUNT(*) AS n FROM test_customers_negative GROUP BY customer_id HAVING COUNT(*) > 1

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM test_customers_negative WHERE TRY_CAST(birth_date AS DATE) IS NULL

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM test_customers_negative WHERE TRY_CAST(birth_date AS DATE) > current_date()

# COMMAND ----------

# MAGIC %sql
# MAGIC SELECT * FROM test_customers_negative WHERE name = '' OR balance < -10000