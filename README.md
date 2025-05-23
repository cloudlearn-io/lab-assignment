# Lab Assignment

### Overview

Welcome to your Cloudlearn lab assignment. As part of this exercise, you’ll design a full hands-on Azure lab for our platform. This lab will be consumed by learners to understand a specific Azure topic. 

The assignment is split into three parts, detailed below. 

### Part 1 - Provisioning Template & Security Policy

**Objective**:

- Provide an ARM template that provisions the initial environment

**Requirements:**

- The provisioning template must deploy all necessary resources required at the beginning of the lab.
- This serevs as the starting point of the lab

### Part 2 - Lab Instructions (Markdown)

**Objective:**

- Write step-by-step instructions in markdown format.

**Requirements:**

- Instructions must be clear, concise, and use proper formatting (headings, bullet points, code blocks).
- Include screenshots for every instruction.
- Provide necessary explanations for step below the screenshot where necessary.
- Reference sample instructions provided to maintain consistency with platform style.

### Lab Topic: Implement Solutions That Use Azure Queue Storage Queues (EXAMPLE TOPIC)

This is an example topic. Your Lab Toppic will be sent separately.

In this lab, you will:

- Provide user’s with a storage account with Azure Queue Storage.

You will teach users to:

- Create and manage queues.
- Enqueue and dequeue messages using the Azure Portal, CLI, or a web application.

### Submission Instruction

The submission should be in the following folder structure sent as a ZIP file.

```jsx
📁 lab-submission/
├── 📁 environment/
│   ├── template.json
│   
│
├── 📁 instructions/
│   ├── 📁 step1/
│   │   ├── step1.md
│   │   └── 📁 assets/
│   │       └── screenshot1.png
│   │       └── screenshot2.png
│   │
│   ├── 📁 step2/
│   │   ├── step2.md
│   │   └── 📁 assets/
│   │       └── screenshot1.png
│   │
│   └── ...
└── README.md  # (Optional: Explain structure, assumptions, or instructions for reviewers)
```

### Tips to Get Started

- Make sure you have az cli installed and you are logged in.
    - Install here: https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

**Part 1: Creating the template and policy - The starting point of the lab**

- Create the `template.json` based on the lab topic.
- Run the `deploy_lab.sh` script:
    - In the submission directory, run the command `./deploy_lab.sh <your-resource-group-name>` (mac/linux)
      - `.\deploy_lab.ps1 -ResourceGroup "your-resource-group-name"` (windows)
    - This will deploy the template from `template.json`
- Once deployment is complete without errors, check to see if the required resources are in the resource group as you planned.

**Part 2: Writing step-by-step instruction**

- Once the template and policy is deployed as per your lab requirements. Start writing instructions for the lab in the `instruction` directory. If your lab consists of more than 1 step. Split it into multiple steps (3 max) based on the folder structure described above.
- Each step can have between 8 - 18 instructions.

**Part 3: Clean up**

- When testing the templates you would often need to start over.
- Simply delete the resources within the resource group manually. **Dont Delete the RG itself**.