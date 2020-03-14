#!/bin/bash

UPLOAD_URL=http://localhost:3000/api/v1/upload_interview

curl -v --form \
    "file=@study_1_response_1583918106303.zip;filename=study_1_response_1583918106303.zip" \
    $UPLOAD_URL
