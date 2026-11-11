# Lab 08: Knowledge check

**Answer each question below it, in your own words, in one to three sentences.** Replace the `...` below **Your answer:** with your text. Questions 1 and 3 also ask for saved output, which goes into the directory `results/`.

## 1. Slurm: what jobs have I submitted?

**Your task:** print a history of all your Slurm job submissions *since November 4, 2026*. Format the output to include the job ID, job name, node list, partition, account, user, state, start time, and elapsed time. See the job accounting fields in the [sacct documentation](https://slurm.schedmd.com/sacct.html). You may also ask Claude Code or another LLM for the exact command. 

Redirect the command's output to `results/job-history.txt` and include the file in your submission. Do not worry if some earlier jobs failed or were canceled. The complete history should show your process, including trial and error.

*Hint:* See [Part 1, Step 6](README.md#step-6-check-how-the-tasks-ended) in the README.

**Your answer:** Provide the entire command you used, including all CLI options.

History:
    User      State               Start    Elapsed 
------------ -------------------- -------------------- ---------- ---------- --------- ---------- ------------------- ---------- 
22457635               ood_vscode         udc-aw32-1c0 interacti+     ds2022    hcz6jh CANCELLED+ 2026-11-04T12:02:03   00:00:19 
22457635.ba+                batch         udc-aw32-1c0                ds2022            CANCELLED 2026-11-04T12:02:03   00:00:20 
22833008_[1]            summarize        None assigned    gpu-mig     ds2022    hcz6jh    PENDING             Unknown   00:00:00 
22836480_[1+            summarize        None assigned    gpu-mig     ds2022    hcz6jh    PENDING             Unknown   00:00:00 

Command: sacct --starttime=2026-11-04 \
  --format=JobID,JobName%20,NodeList%20,Partition,Account,User,State,Start,Elapsed \
  > results/job-history.txt

NOTE: was still waiting for jobs to start/finish 


## 2. Slurm: did every array task run at the same time?

You submitted your entire job array with one `sbatch` command, but Slurm scheduled each task separately.

**Your task:** in the job history from Question 1, find the tasks from your most recent completed array run. Compare their start times and elapsed times.

*Hint:* See [Part 1, Step 5](README.md#step-5-watch-the-job-array) in the README.

**Your answer:** Did all tasks in the array start at the same time? Was the elapsed time identical for every task? Explain why or why not.

Based on what I saw, no. However, at the time that I had to submit this, my array's tasks were still queued. However I can infer that they did not start at the same time because it is done in batches with different amounts of work.

## 3. Slurm: did my job use what it asked for?

Suppose your next job array has 1,000 books instead of 101. Before you submit it, you want to know whether your script asks for too much or too little memory and time.

**Your task:** run `seff` for **one** task of your finished job array, and save its output as `results/seff.txt`.

*Hint:* `seff` takes the ID of one task, such as `4211873_1`. Compare its **Memory Utilized** and **Job Wall-clock time** with `--mem` and `--time` in your `summarize.slurm`.

**Your answer:** How much memory and time did the task use, compared with what your script asked for? What would you change in your script, and why?

I cannot complete this question because my job was not processed.

