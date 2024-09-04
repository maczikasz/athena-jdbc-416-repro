resource "aws_glue_catalog_database" "athena_jdbc_repro" {
    name = "athena-jdbc-repro"
}

resource "aws_s3_bucket" "athena_jdbc_repro_bucket" {
    bucket = "athena-jdbc-repro-bucket"
    force_destroy = true

}

resource "aws_athena_workgroup" "athena_jdbc_repro_workgroup" {
    name = "athena-jdbc-repro-workgroup"

    force_destroy = true
    configuration {
        result_configuration {
            output_location = "s3://${aws_s3_bucket.athena_jdbc_repro_bucket.bucket}/"
        }
    }
}

resource "aws_glue_catalog_table" "test" {
    database_name = aws_glue_catalog_database.athena_jdbc_repro.name
    name          = "test"

    table_type = "EXTERNAL_TABLE"

    storage_descriptor {

        location = "s3://${aws_s3_bucket.athena_jdbc_repro_bucket.bucket}/athena-jdbc-repro-table/"

        columns {
            name = "id"
            type = "int"
        }

    }
}
