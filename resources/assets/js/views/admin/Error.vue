<template>
     <div class="error-page">
         <h2 class="headline text-yellow">403</h2>

         <div class="error-content" style="padding-top: 30px">
             <h3><i class="fa fa-warning text-yellow"></i>没有权限。</h3>

             <p>
                 没有权限.
                 此时你可以返回 <a href="/admin">首页</a> 或者返回 <a @click="$router.back();">上一页</a>
             </p>
         </div>
     </div>
</template>

<script>
export default {
}
</script>

<style lang="css">
</style>
