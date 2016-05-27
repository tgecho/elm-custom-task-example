//Native.Scheduler //

var _tgecho$elm_custom_task_example$Native_Ffi = function() {

function promise(name, arg)
{
	return _elm_lang$core$Native_Scheduler.nativeBinding(function(callback) {
		try {
			window[name].call(null, arg)
				.then(function(result) {
					console.log(result)
					callback(_elm_lang$core$Native_Scheduler.succeed(result));
				})
				.catch(function(error) {
					callback(_elm_lang$core$Native_Scheduler.fail(error));
				});
		} catch (error) {
			callback(_elm_lang$core$Native_Scheduler.fail(error));
		}

	});
}

return {
	promise: F2(promise)
};

}();
