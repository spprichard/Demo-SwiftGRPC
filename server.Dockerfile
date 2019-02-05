FROM swift:4.2

ADD ./.release/x86_64-unknown-linux/release/EchoServer /app/EchoServer

# EXPOSE 9000

CMD /app/EchoServer
