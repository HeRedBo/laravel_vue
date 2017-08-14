<template>
    <header class="main-header">
        <!-- logo -->
        <a  href ="" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini">{{name}}</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg">{{name}}</span>

        </a>

        <nav class="navbar navbar-static-top">
            <a class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>

            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <li class="drondown messages-menu">
                        <a href="#" class="dropdown-toggle" @click="loadMsgList" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">{{msgNum}}</span>
                        </a>

                        <ul class="dropdown-menu">
                            <li class="header">你有 {{msgNum}} 条未读消息</li>
                            <li>
                                <ul class="menu">
                                    <li v-for="item in msgList">  <!-- start message -->
                                        <a href="#">
                                            <div class="pull-left">
                                                <img :src="item.users.picture" class="img-circle" alt="User Image">
                                            </div>

                                            <h4>
                                                {{item.users.username}}
                                                <small><i class="fa fa-clock-o">{{ item.created_at}}</i></small>
                                            </h4>
                                            <p>{{item.content}}</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">查看所有</a></li>
                        </ul>
                    </li>


                    <li class="dropdown user user-menu">
                        <router-link to="/admin/user/info" dasta-toggle="dropdown">
                            <img :src="user.picture" class ="user-image" alt="User imgage">
                            <span class="hidden-xs">{{user.name}}</span>
                        </router-link>
                    </li>
                    <li><a href="/admin/logout">退出</a></li>
                </ul>
            </div>
        </nav>
    </header>

</template>

<script type="text/javascript">
    import { mapActions } from 'vuex';
    export default {
        data() {
            return {
                user:window.User,
                name:window.Name,
                msgNum:window.msgNum,
                msgList:{}
            }
        },
        created(){
            this.websocket();
            var websocket = this.$store.state.websocket,that = this;
            websocket.onopen = function () {

            };

            websocket.onmessage = function (evt) {
                that.msgNum = evt.data;
                $(".message-menu").addClass('open');
                that.loadMsgList();
            }
        },
        methods : {
                ...mapActions([
                    'websocket'
                ]),

                loadMsgList() {
                    var url = '/admin/msg';
                    this.callHttp("GET",url,{},function(json){
                        this.msgList = json;
                    });
                }
        }

    }
</script>
