#Define your base image 
FROM eclipse-temurin:17-jdk-focal 

#Maintainer of this image
LABEL maintainer="Palak Bhawsar" 
                                                                                                                            
#Copying Jar file from target folder                                                                                       
COPY target/web-services.jar web-services.jar  

#Expose app to outer world on this port                                                                                                                                                                                                                                                                          
EXPOSE 8081   
                                                                                                                                               
#Run executable with this command  
ENTRYPOINT ["java", "-jar", "web-services.jar"] 
