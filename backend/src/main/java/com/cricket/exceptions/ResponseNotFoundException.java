package com.cricket.exceptions;

public class ResponseNotFoundException extends RuntimeException {

    public ResponseNotFoundException(String message){
        super(message);
    }
}
