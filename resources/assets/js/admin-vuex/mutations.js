export const websocket = (state) => {
    var wsServer = 'ws://127.0.0.1:9502?uid='+ window.User.id;
    //调用 websocket 对象连接
    var websocket = new WebSocket(wsServer);
    return state.websocket = websocket;
}
