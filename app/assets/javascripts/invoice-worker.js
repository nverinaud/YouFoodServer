var i = 0;

function onMessage() {
    i = i + 1;
    postMessage(i);
    setTimeout("onMessage()", 10000);
}

onMessage();