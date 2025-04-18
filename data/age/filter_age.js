const fs = require('fs');
const readline = require('readline');

const inputFile = '../Age.jsonl';
const outputFile = 'age2.jsonl';

// Create readable and writable streams
const readStream = fs.createReadStream(inputFile, { encoding: 'utf8' });
const writeStream = fs.createWriteStream(outputFile, { encoding: 'utf8' });

// Create interface for reading line by line
const rl = readline.createInterface({
  input: readStream,
  crlfDelay: Infinity
});

let totalItems = 0;
let filteredItems = 0;

// Process each line
rl.on('line', (line) => {
  totalItems++;
  
  try {
    const item = JSON.parse(line);
    
    // Check if the item matches both filter criteria
    if (item.question_polarity === 'nonneg' && item.context_condition === 'disambig') {
      writeStream.write(line + '\n');
      filteredItems++;
    }
  } catch (err) {
    console.error('Error parsing JSON:', err);
  }
});

// Handle end of file
rl.on('close', () => {
  console.log(`Total items processed: ${totalItems}`);
  console.log(`Items matching criteria: ${filteredItems}`);
  console.log(`Filtered data saved to ${outputFile}`);
});

// Handle errors
readStream.on('error', (err) => {
  console.error('Error reading file:', err);
});

writeStream.on('error', (err) => {
  console.error('Error writing file:', err);
}); 