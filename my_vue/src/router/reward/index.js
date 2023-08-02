import rewardView from "@/views/reward/rewardView";
import rewardManagement from "@/views/reward/rewardManagement";
import signIn from "@/views/reward/signIn";

let reward=[
    {
        path:'/rewardView',
        component:rewardView
    },
    {
        path:'/rewardManagement',
        component:rewardManagement
    },
    {
        path:'/signIn',
        component:signIn
    },
]

export default reward;