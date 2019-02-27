<%@ include file="/init.jsp" %>

<!-- template for the polygraph component. -->
<script type="text/x-template" id="polygraph-template">
	<g>
		<polygon :points="points"></polygon>
		<circle cx="100" cy="100" r="80"></circle>
		<axis-label
				v-for="(stat, index) in stats"
				:stat="stat"
				:index="index"
				:total="stats.length">
		</axis-label>
	</g>
</script>

<!-- template for the axis label component. -->
<script type="text/x-template" id="axis-label-template">
	<text :x="point.x" :y="point.y">{{stat.label}}</text>
</script>

<!-- demo root element -->
<div id="<portlet:namespace />-1">
	<!-- Use the component -->
	<svg width="200" height="200">
		<polygraph :stats="stats"></polygraph>
	</svg>
	<!-- controls -->
	<div v-for="stat in stats">
		<label>{{stat.label}}</label>
		<input type="range" v-model="stat.value" min="0" max="100">
		<span>{{stat.value}}</span>
		<button @click="remove(stat)" class="remove">X</button>
	</div>
	<form id="add">
		<input name="newlabel" v-model="newLabel">
		<button @click="add">Add a Stat</button>
	</form>
	<pre id="raw">{{ stats }}</pre>
</div>

<p style="font-size:12px">* input[type="range"] requires IE10 or above.</p>

<aui:script require="<%= mainRequire %>">
	main.default('<portlet:namespace />');
</aui:script>
