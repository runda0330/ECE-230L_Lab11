# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names

Runda Li and Gaven Stecher

## Summary

We built a modulo counter and a ripple counter using flip-flops. In the modulo counter, three full adders calculate the current state plus one, and three D flip-flops store the count. When the state reaches 5, the next clock edge clears the count and toggles a separate output flip-flop. This gives a divide-by-12 output. The ripple counter uses three T flip-flops, each built from a D flip-flop with XOR feedback. Each stage uses the inverted output of the previous stage as its clock, so the state counts upward from 000 through 111. The final stage divides the input frequency by 8. We also used an asynchronous reset to clear all flip-flops and a synchronous clear to wrap the modulo counter.

## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?

The output toggles after every Count input clock cycles. One complete output period needs two toggles, so it takes 2 * Count input cycles. Our counter goes through six states, 0 through 5, and toggles its output every six cycles. Therefore, its output frequency is the input frequency divided by 12.

### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?

For the ripple-counter connection assumed by this question, each stage's Q output clocks the next positive-edge-triggered stage. Starting at 000, the first input edge changes the first stage from 0 to 1. That rising edge triggers the second stage, and its rising edge triggers the third stage. After the transitions propagate, the state becomes 111.

Our code connects the inverted Q output to the next stage's clock. With this connection, the next stage toggles when the previous Q falls from 1 to 0. Starting from a cleared state, the first input pulse produces 001, and the counter counts upward through 111 before returning to 000.

### 3 - What width of ring counter would you use to get to an output of ~1KHz?

Using the Basys 3's 100 MHz clock, an N-stage ripple counter produces an output frequency of 100,000,000 / 2^N Hz. Since log2(100,000,000 / 1,000) is approximately 16.61, we would use 17 stages. The output would be approximately 763 Hz. A 16-stage counter produces approximately 1,526 Hz, so 17 stages give the closer frequency to 1 kHz.
