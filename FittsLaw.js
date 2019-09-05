var caseNumber = 0;
var caseActive = false;
/**
 * calculates the index of difficulty for a given distance and a given object width
 * @param distance {number} - the distance between start and end point in px
 * @param objectWidth {number} - the real object width in px
 * @return {number} - the index of difficulty
 */
function getDifficultyIndex( distance, objectWidth ) {
    var iod;
    iod = Math.log((2*distance)/objectWidth)/Math.log(2);
    return iod;
}
/**
 * calculates all results and stores them, separated by commas, in a string
 * @param start {QMLComponent} - the start object (rectangle where mouse movement started)
 * @param target {QMLComponent} - the target object (button where the mouse was moved to)
 * @param time {number} - the time in ms the user needed to move from rectangle to the button (start to target)
 * @return {string} - the result data as string holding the data as comma separated values
 */
function calculateResults(start, target, time){
    var string = "";
    return string;
}
function calculateResults(proband, start, target, time){

    var string = proband+","
            +getDistance(start,target)+","
            +getRealWidth(start,target)+","
            +time+","+
            getDifficultyIndex(getDistance(start,target),getRealWidth(start,target));

    return string;
}
/**
 * a stopwatch to count the elapsed navigation time
 * @method start {number} - starts the clock
 * @method stop {number} - returns the elapsed time since calling Time.StopWatch.start() in ms
 */
var StopWatch = (function() {
    var startTime;
    var stopTime;
    return {
        start: function() {
            startTime = new Date();
        },
        stop: function() {
            stopTime = new Date();
            return stopTime - startTime;
        }
    }
})();
/**
 * returns the center of an qml component
 * @param object {QMLObject} - the object the get the center from
 * @return {Object} - the centers x- and y-coordinates: { x: number, y: number }
 */
function getCenter( object ){
    return {
        x: ( object.x + ( object.width / 2 ) ),
        y: ( object.y + ( object.height / 2 ) )
    }
}
/**
 * gets the distance between two points / positions
 * @param startPosition {Object} - format: { x: number, y: number }
 * @param targetPosition {Object} - format: { x: number, y: number }
 * @return {number} - the distance in px
 */
function getDistance( startPosition, targetPosition ) {
    var distance = Math.sqrt(Math.pow(targetPosition.x-startPosition.x,2)+Math.pow(targetPosition.y-startPosition.y,2));
    return distance;
}
/**
 * gets the angle dependend width of a rectangle-object (like a button) from a certain position
 * @param startPosition - where to start the calculation, format: { x: number, y: number }
 * @param object {QMLComponent} - the target component (a rectangle)
 * @return {number} - the real width in px
 */
function getRealWidth( startPosition, object ) {
    var targetPosition = getCenter( object );
    var xDiff = Math.abs( targetPosition.x - startPosition.x  );
    var yDiff = Math.abs( targetPosition.y - startPosition.y );
    var angle = Math.atan2( xDiff, yDiff );
    var grad = angle * 180 / Math.PI;
    var switchAngle =  Math.atan2( object.width, object.height ) * 180 / Math.PI;
    if ( grad <= switchAngle ) return object.height / Math.cos( angle );
    return object.width / Math.sin( angle );
}

function getCase()
    {
    return caseNumber;
    }
function increaseCase()
    {
    caseNumber++;
    }
