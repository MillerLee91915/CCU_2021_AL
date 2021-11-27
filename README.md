# CCU_2021_AL

## 程式內容

### 程式功能
給定一串陣列以及陣列大小，經過排序之後產生一串新的陣列，並且當程式執行到nop時，r10暫存器存放陣列的起始位址

### 排序演算法：Selection Sort
每次都從「未排序」的陣列裡面挑出最小值，再把它放到「已排序」的最右邊，直到「未排序」的陣列裡面是空的。

Example: 
Please sort 2 3 1 in selection sort 
sorted / unsorted
/ 2 3 1
1 / 2 3 
1 2 / 3 
1 2 3 /

### 實作部分
hw4_test.s:
在 Data Section 的部分先輸入陣列。在利用 LDM/STM 這組指令複製資料，讓 NumSort 可以讀取到所需的資料。 
numsort.s:
在 Data Section 建立一個大小跟輸入一樣的空陣列，一樣利用 LDM/STM 這組指令複製資料，把陣列起始位址 Load 到 r10 、陣列大小 Load 到 r9。
先把陣列的內容複製到空陣列裡面，之後再利用 Selection sort 排序，這裡利用 CMP / BEQ 來達到 C 語言中 for loop 的效果。當我們遍歷陣列的
時候，我們把目前的最小值放在 r1 裡面，每次都和當前遍歷的值 r6 進行比較，當遍歷完整個陣列後，進行 SWAP (先把兩個位址 Load 出來，在 Store)
到對方的位址，當我們遍歷了 N (N=array size) 之後，陣列就排序完成了。
接著再把陣列起始位址存到 r10。

## 如何編譯
arm-none-eabi-gcc -g ./hw4_test.s  ./numsort.s -o hw4
## 如何執行
arm-none-eabi-insight ./hw4
