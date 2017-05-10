/* 日期选择 */
define(['web_old_datepicker'], function(){
    var $startDate = $(".js-datepicker[data-type='checkin']"),
        $endDate = $(".js-datepicker[data-type='checkout']"),
        startDateText = $startDate.val(),
        endDateText = $endDate.val(),
        startDate = toTimestamp(startDateText),
        endDate = toTimestamp(endDateText),
        $endDialog;

    function toTimestamp(day){
        return new Date(day).getTime();
    }

    function renderEachDay(day){
        var date = day.getTime(),
            startDateText = $startDate.datepicker('getDate'),
            endDateText = $endDate.datepicker('getDate'),
            startDate = toTimestamp(startDateText),
            endDate = toTimestamp(endDateText),
            arr;
        if(date > startDate && date < endDate){
            arr = [true, 'ui-state-selected ui-state-between', ''];
        }else if(date == startDate){
            arr = [true, 'ui-state-startDay', ''];
        }else if(date == endDate){
            arr = [true, 'ui-state-endDay', ''];
        }else if(date > endDate){
            arr = [true, 'ui-state-after-endDay', ''];
        }else{
            arr = [false, 'ui-state-before-startDay', ''];
        }
        date = startDateTe = endDateText = startDate = endDate = null;
        return arr;
    }

    $startDate.datepicker({
        changeMonthType:true,
        changeYear:true,
        dateFormat:"yy-mm-dd",
        minDate:new Date()
    });

    $endDate.datepicker({
        changeMonthType:true,
        changeYear:true,
        dateFormat:"yy-mm-dd",
        numberOfMonths:2,
        minDate:new Date(startDate),
        beforeShowDay:renderEachDay
    });

    /*
        缓存结果日期dom
     */
    $endDialog = $endDate.datepicker('widget');

    $endDate.datepicker('option',{
        beforeShow:function(){
            if (!$startDate.val()) {
                $endDate.blur();
                return false;
            }
            $endDialog.on('mouseover', '.ui-state-after-endDay,.ui-state-endDay', function(e){
                var $this = $(this),
                    $afterEndDay = $endDialog.find('.ui-state-after-endDay,.ui-state-endDay'),
                    i=0,
                    $aDate;

                $afterEndDay.removeClass("ui-state-selected ui-state-hover");
                $this.addClass("ui-state-hover");

                //剩余选中日期为浅色
                for(var i = 0, len = $afterEndDay.size(); i<len; i++){
                    $aDate = $afterEndDay.eq(i);
                    $aDate.addClass("ui-state-selected");
                    if($aDate.hasClass("ui-state-hover")){
                        break;
                    }
                };
            }).on('mouseover', '.ui-state-between,.ui-state-before-startDay', function(e){
                var $this = $(this),
                    $afterEndDay = $endDialog.find('.ui-state-after-endDay,.ui-state-endDay');
                $afterEndDay.removeClass("ui-state-selected ui-state-hover");
                $this.addClass("ui-state-hover");
            })
        },
        onClose:function(){
            $endDialog.off('mouseover', '.ui-state-after-endDay');
        }
    });

    //设置关联
    $startDate.datepicker('option','onSelect',function(aValue, inst){
        var $this = $(this),
            startDateText = $this.datepicker('getDate'),
            curEndDateText = $endDate.datepicker('getDate'),
            startDate = toTimestamp(startDateText),
            curEndDate = toTimestamp(curEndDateText),
            endDate, endMinDate;

        endMinDate = new Date(startDate + 1*3600*24*1000);
        endDate = new Date(Math.max(startDate + 1*3600*24*1000, curEndDate));

        setTimeout(function(){
            $endDate
                .datepicker('option',{
                    'minDate':endMinDate
                })
                .datepicker('setDate', endDate)
                .datepicker('show');
        },200); 
    })
});
