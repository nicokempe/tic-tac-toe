<template>
  <div :class="['flex flex-col items-center justify-center min-h-screen px-4','bg-gradient-to-br from-cyan-300 to-light-blue-500 dark:bg-gradient-to-br dark:from-gray-800 dark:to-black',{ 'dark': isDarkMode }]">
    <button @click="toggleDarkMode" class="absolute top-4 right-4 bg-gray-200 dark:bg-gray-600 p-2 rounded">
      Toggle Dark Mode
    </button>

    <h1 class="text-3xl md:text-4xl font-bold mb-6">
      Tic-Tac-Toe: <span :class="['text-cyan-600', {'dark:text-cyan-400': isDarkMode}]">{{ currentPlayer }}'s Turn</span>
    </h1>
    <div class="grid grid-cols-3 gap-4 mb-6 w-full max-w-md">
      <button v-for="(cell, index) in board.cells" :key="index"
              class="aspect-square bg-white bg-opacity-60 dark:bg-gray-700 dark:bg-opacity-80 rounded-lg shadow-md text-5xl md:text-6xl font-bold transition duration-300 ease-in-out transform hover:scale-105 hover:bg-opacity-80"
              :class="{
                'text-cyan-600': cell === 'X' && !isDarkMode,
                'text-blue-700': cell === 'O' && !isDarkMode,
                'dark:text-cyan-400': cell === 'X' && isDarkMode,
                'dark:text-red-400': cell === 'O' && isDarkMode
              }"
              @click="handleCellClick(index)">
        {{ cell }}
      </button>
    </div>
    <p v-if="winner" class="text-xl md:text-2xl font-semibold mb-4">
      Player <span :class="getPlayerClass(winner)">{{ winner }}</span> Wins!
    </p>
    <p v-else-if="draw" class="text-xl md:text-2xl font-semibold mb-4">
      It's a Draw!
    </p>
    <button @click="restartGame" class="px-6 py-2 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-full shadow-xl hover:shadow-2xl transition-all duration-500 ease-in-out transform hover:scale-110 text-lg md:text-xl font-bold dark:from-pink-500 dark:to-purple-500 dark:hover:from-pink-600 dark:hover:to-purple-600">
      <span class="flex items-center justify-center space-x-2">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 animate-spin" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v7h7M20 20v-7h-7" />
        </svg>
        <span>Restart Game</span>
      </span>
    </button>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue';

const isDarkMode = ref(false);

const toggleDarkMode = () => {
  isDarkMode.value = !isDarkMode.value;
};

function getPlayerClass(player: string): Record<string, boolean> {
  return {
    'text-cyan-600': player === 'X' && !isDarkMode.value,
    'text-blue-700': player === 'O' && !isDarkMode.value,
    'dark:text-cyan-400': player === 'X' && isDarkMode.value,
    'dark:text-red-400': player === 'O' && isDarkMode.value,
  };
}

const currentPlayer = ref('X');
const winner = ref(null);
const draw = ref(false);
const board = reactive({ cells: Array(9).fill(null) });

const winningCombinations = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
];

const checkForWinner = () => {
  let foundWinner = null;
  winningCombinations.some((combination) => {
    const [a, b, c] = combination;
    if (
      board.cells[a]
      && board.cells[a] === board.cells[b]
      && board.cells[a] === board.cells[c]
    ) {
      foundWinner = board.cells[a];
      return true;
    }
    return false;
  });
  return foundWinner;
};

const checkForDraw = () => board.cells.every((cell) => cell !== null) && winner.value === null;

const handleCellClick = (index: number) => {
  if (!board.cells[index] && !winner.value) {
    board.cells[index] = currentPlayer.value;
    const winningPlayer = checkForWinner();
    if (winningPlayer) {
      winner.value = winningPlayer;
    } else if (checkForDraw()) {
      draw.value = true;
    } else {
      currentPlayer.value = currentPlayer.value === 'X' ? 'O' : 'X';
    }
  }
};

const restartGame = () => {
  board.cells.fill(null);
  winner.value = null;
  draw.value = false;
  currentPlayer.value = 'X';
};
</script>
