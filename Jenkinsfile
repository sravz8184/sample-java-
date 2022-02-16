node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerhubpwd') {

        def customImage = docker.build("sravz408/webapp")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
