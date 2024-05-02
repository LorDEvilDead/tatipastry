import { onMount } from 'svelte';

onMount(async () => {
  try {
    const response = await ('http://localhost:3000//messages');
    if (response.ok) {
      const data = await response.text();
      messageStore.set(data);
    } else {
      throw new Error('Ошибка при получении данных');
    }
  } catch (error) {
    console.error(error);
    messageStore.set('Ошибка при получении данных');
  }
});
,