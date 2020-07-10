
/*
基本配置*/

var myConfig= {
    chooseColor:function (color,title) {
        var d='';
        switch (color) {
            case 1:
            d='<span class="label label-danger">'+title+'</span>';
                break;
            case 2:
                d='<span class="label label-danger">'+title+'</span>';
                break;
            case 3: d='<span class="label label-success">'+title+'</span>';
                break;
            case 4: d='<span class="label label-info">'+title+'</span>';
                break;
            case 5: d='<span class="label-warning">'+title+'</span>';
                break;
            default:
                d= '<span class="label label-default">'+title+'</span>';
        }
        return d;
    },
    resultCode:{nameSake:440,relate:441,validFail:442,notNull:443,success:444,notFind:445,exception:446
    }
}
