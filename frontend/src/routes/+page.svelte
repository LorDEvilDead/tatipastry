<script>
	import { onMount } from 'svelte';

	let message = '';

	onMount(() => {
		fetch('http://localhost:3000/index')
			.then((response) => response.json())
			.then((data) => (message = data.message));
	});
</script>

<p>{message}</p>
