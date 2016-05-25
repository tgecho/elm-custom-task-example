//Native.Scheduler //

var _tgecho$elm_custom_task_example$Native_Number = function() {

function getNumber(number)
{
	return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
			return callback(_elm_lang$core$Native_Scheduler.succeed(number));
	});
}

return {
	getNumber: getNumber
};

}();
