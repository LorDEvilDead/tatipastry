import { onMount } from 'svelte';
import { messageStore } from './store'; // Импортируйте messageStore из вашего файла store.js

onMount(async () => {
  try {
    const response = await fetch('/messages');
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