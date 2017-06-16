<template>
    <div class="wrapper">
        

    </div>
    <div class="content-wrapper">
        
        <section class="content">
            <router-view></router-view>

            <!-- page Content Here -->
        </section>
    </div>

   <sidebar class="controler-sidebar  control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
            
        </ul>

        <!-- Tab panes  -->
        <div class="tab-content">
        <!-- Home tab content -->
            <div id="control-sidebar-home-tab" class ="tab-pane">
                
            </div>
            <!-- ./tab-pane  -->
            <!-- Status tab content -->
            <div id="control-sidebar-status-tab" class ="tab-pane">
                Status Tab Content
            </div>
            <!-- ./tab-pane  --> 

        </div>
    </sidebar>
    <div class="content-sidebar-bg"></div>
</template>

<script type="text/javascript">
    import {mapActions, mapGetters} from 'vuex';
    import Mheader from './Mheader.vue';
    import Sidebar from './Sidebar.vue';

    export default {
        components : {
            Mheader,
            Sidebar
        },
        method() {

        },
        methods : {
            
        }
    }
</script>

