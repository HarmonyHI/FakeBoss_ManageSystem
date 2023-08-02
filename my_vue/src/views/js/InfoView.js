export default{
    name:'InfoView',
    data() {
        return{
            user:{}
        }
    },
    created() {
        this.user=JSON.parse(sessionStorage.getItem("info"));
    }
}