<script>
    import { onMount } from 'svelte';
  
    let message = '';
  
    onMount(async () => {
      const response = await fetch('/messages');
      if (response.ok) {
        message = await response.text();
      } else {
        message = 'Ошибка при получении данных';
      }
    });
  </script>
  
  <main>
    <h1>{message}</h1>
  </main>
  