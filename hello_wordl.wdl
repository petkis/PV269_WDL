version 1.0

workflow hello_world {
    call say_hello

    output {
        String message = say_hello.message
    }
}

task say_hello {
    command <<<
        echo "Hello World!" > hello.txt
    >>>

    output {
        String message = read_string("hello.txt")
    }

    runtime {
        docker: "ubuntu:22.04"
    }
}

