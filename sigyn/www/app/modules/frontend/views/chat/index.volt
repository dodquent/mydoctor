<h1>Websocket Chat Server</h1>
<div id="messages"></div>

<script type="text/javascript">
    var conn = new WebSocket('ws://{{HTTP_HOST}}:{{WEBSOCKET_PORT}}');

    conn.addEventListener('open', function(e) {
        addMessage("Connection established!");
        helloWorldPing();
    });

    conn.addEventListener('message', function(e) {
        addMessage(e.data);
    });

    function helloWorldPing() {
        if (conn.readyState === conn.OPEN) {
            conn.send('Hello World!');
            setTimeout(helloWorldPing, 3000);
        }
    }

    function addMessage(message) {
        var messageTag = document.createElement('div');
        messageTag.innerHTML = message;

        console.log(message);
        document.getElementById('messages')
            .appendChild(messageTag);
    }

</script>